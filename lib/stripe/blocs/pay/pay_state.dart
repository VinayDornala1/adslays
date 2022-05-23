part of 'pay_bloc.dart';

@immutable
class PayState {
  final double totalPay;
  final String currency;
  final bool isActiveCard;
  final CreditCardCustom? card;
  
  String get amount => '${ (totalPay * 100).floor() }';

  const PayState({
    this.totalPay = 375.55, 
    this.currency = 'USD', 
    this.isActiveCard = false, 
    this.card
  });

  PayState copyWith({
    double? totalPay,
    String? currency,
    bool? isActiveCard,
    CreditCardCustom? card,
  }) => PayState(
    totalPay    : totalPay ?? this.totalPay,
    currency    : currency ?? this.currency,
    isActiveCard: isActiveCard ?? this.isActiveCard,
    card        : card ?? this.card,
  );
}

