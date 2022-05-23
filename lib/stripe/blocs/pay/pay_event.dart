part of 'pay_bloc.dart';

@immutable
abstract class PayEvent {
  const PayEvent();
}

class OnSelectCardEvent extends PayEvent{
  final CreditCardCustom card;
  const OnSelectCardEvent(this.card);
}
class OnDeactiveCard extends PayEvent {}
