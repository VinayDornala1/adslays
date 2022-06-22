// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// // import 'package:adslay/blocs/pay/pay_bloc.dart';
// // import 'package:adslay/helpers/helpers.dart';
// // import 'package:adslay/services/stripe_service.dart';
// import 'package:stripe_payment/stripe_payment.dart';
//
// import '../blocs/pay/pay_bloc.dart';
// import '../helpers/helpers.dart';
// import '../services/stripe_service.dart';
//
// class TotalPayButton extends StatelessWidget {
//   const TotalPayButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final payBloc = context.read<PayBloc>();
//     final width = MediaQuery.of(context).size.width;
//     return Container(
//       width: width,
//       height: 100,
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Total:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 '${payBloc.state.totalPay} ${payBloc.state.currency}',
//                 style: const TextStyle(fontSize: 20)
//               )
//             ],
//           ),
//           BlocBuilder<PayBloc, PayState>(
//             builder: (context, state) {
//               return _BtnPay( state: state );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _BtnPay extends StatelessWidget {
//   final PayState state;
//   const _BtnPay({Key? key, required this.state}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return state.isActiveCard ? buildCardButton(context) : buildAppleAndGooglePay(context);
//   }
//
//   Widget buildCardButton(BuildContext context) {
//     return MaterialButton(
//       height: 45,
//       minWidth: 170,
//       shape: const StadiumBorder(),
//       elevation: 0,
//       color: Colors.black,
//       child: Row(
//         children: const [
//           Icon(
//             FontAwesomeIcons.solidCreditCard,
//             color: Colors.white,
//           ),
//           Text('  Payment', style: TextStyle(color: Colors.white, fontSize: 22))
//         ],
//       ),
//       onPressed: () async {
//         showLoading(context);
//         final stripeService = StripeService();
//         final card = state.card!;
//         final monthYear = card.expiracyDate.split('/');
//         final resp = await stripeService.payWithExistCard(
//           amount: state.amount,
//           currency: state.currency,
//           card: CreditCard(
//             number: card.cardNumber,
//             expMonth: int.parse(monthYear[0]),
//             expYear: int.parse(monthYear[1]),
//           )
//         );
//
//         Navigator.pop(context);
//         if ( resp.ok ) {
//           showAlert(context, 'Credit Card ok', 'Success Payment');
//         } else {
//           showAlert(context, 'Upsssss!', resp.msg!);
//         }
//       },
//     );
//   }
//
//   Widget buildAppleAndGooglePay(BuildContext context) {
//     return MaterialButton(
//       height: 45,
//       minWidth: 150,
//       shape: const StadiumBorder(),
//       elevation: 0,
//       color: Colors.black,
//       child: Row(
//         children: [
//           Icon(
//             Platform.isAndroid
//                 ? FontAwesomeIcons.google
//                 : FontAwesomeIcons.apple,
//             color: Colors.white,
//           ),
//           const Text(' Pay',
//               style: TextStyle(color: Colors.white, fontSize: 22))
//         ],
//       ),
//       onPressed: () async {
//         final stripeService = StripeService();
//         final resp = await stripeService.payWithApplePayGooglePay(
//           amount: state.amount,
//           currency: state.currency
//         );
//       },
//     );
//   }
// }
