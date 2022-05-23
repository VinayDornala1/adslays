import 'package:dio/dio.dart';
import 'package:stripe_payment/stripe_payment.dart';

import '../models/payment_intent_response.dart';
import '../models/stripe_custom_response.dart';

class StripeService {

  // Singleton

  StripeService._privateConstructor();

  static final StripeService _instance = StripeService._privateConstructor();

  factory StripeService() => _instance;

  final String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  static const String _secretKey = 'sk_test_51KrBoTEeBLujSW5lxK3sNLSZYM5UjEWyv3pM0VcUOHg1jQLq8krIc3IwGnhrSAOilesK0RQWhZ6n4vSesTbr2vNH00EBxiLFIX';
  final String _apiKey = 'pk_test_51KrBoTEeBLujSW5l8MFBzwdyhhJWbPmhkRYOsrPkC9npLJYlJbR0WrLSUlGgfIjU7maYsAoqasOncf8PSn2hdQZN00LFVimTMp';
  final headersOptions = Options(
    contentType: Headers.formUrlEncodedContentType,
    headers: {
      'Authorization': 'Bearer ${StripeService._secretKey}'
    }
  );
  void init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: _apiKey,
        androidPayMode: 'test',
        merchantId: 'test'
      )
    );
  }

  Future<StripeCustomResponse> payWithExistCard({
    required String amount,
    required String currency,
    required CreditCard card,
  }) async {
    try {
      final paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest( card: card)
      );
      final intAmount = int.parse(amount);

      final resp = await _makePayment(
        amount: intAmount, 
        currency: currency, 
        paymentMethod: paymentMethod
      );
      
      return resp;
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency, 
  }) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest()
      );

      final intAmount = int.parse(amount);

      final resp = await _makePayment(
        amount: intAmount, 
        currency: currency, 
        paymentMethod: paymentMethod
      );
      
      return resp;
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future<StripeCustomResponse> payWithApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {
    try {
      final newAmount = double.parse(amount) / 100;
      final token = await StripePayment.paymentRequestWithNativePay(
        androidPayOptions: AndroidPayPaymentRequest(
          currencyCode: currency, 
          totalPrice: amount
        ), 
        applePayOptions: ApplePayPaymentOptions(
          countryCode: 'US',
          currencyCode: currency,
          items: [
            ApplePayItem(
              label: 'Product 1',
              amount:  '$newAmount'
            )
          ]
        )
      );

      final paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest(
          card: CreditCard(
           token: token.tokenId 
          )
        )
      );

      final intAmount = int.parse(amount);

      final resp = await _makePayment(
        amount: intAmount, 
        currency: currency, 
        paymentMethod: paymentMethod
      );

      await StripePayment.completeNativePayRequest();
      
      return resp;

    } catch (e) {
      print('Error: ${e.toString()}');
      return StripeCustomResponse(
        ok: false,
        msg: e.toString()
      );
    }
  }
  Future<PaymentIntentResponse> _createPaymentIntent({
    required int amount,
    required String currency,
  }) async {
    try {
      final dio = Dio();
      final data = {
        'amount': amount,
        'currency': currency,
      };

      final resp = await dio.post(
        _paymentApiUrl, 
        data: data,
        options: headersOptions
      );

      return PaymentIntentResponse.fromMap( resp.data );
    } catch (e) {
      print('Error: ${e.toString()}');
      return PaymentIntentResponse(
        status: '400'
      );
    }
  }
  Future<StripeCustomResponse> _makePayment({
    required int amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {
    try {
      
      // create intent
      final paymentIntent = await _createPaymentIntent(amount: amount, currency: currency);
      final paymentResult = await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntent.clientSecret,
          paymentMethodId: paymentMethod.id
        )
      );
      if ( paymentResult.status == 'succeeded') {
        return StripeCustomResponse(ok: true);
      } else {
        return StripeCustomResponse(ok: false, msg: 'Ups!!: ${paymentResult.status}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }
}