// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_credit_card/credit_card_widget.dart';
//
// import '../blocs/pay/pay_bloc.dart';
// import '../widgets/total_pay_button.dart';
//
// // import 'package:stripe_app/blocs/pay/pay_bloc.dart';
// // import 'package:stripe_app/widgets/total_pay_button.dart';
//
//
// class CardPage extends StatelessWidget {
//
//   const CardPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final payBloc = BlocProvider.of<PayBloc>(context);
//     final card = payBloc.state.card!;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text( 'Pay' ),
//         leading: IconButton(
//           icon: const Icon( Icons.arrow_back),
//           onPressed: () {
//             payBloc.add( OnDeactiveCard() );
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(),
//           Hero(
//             tag: card.cardNumber,
//             child: CreditCardWidget(
//               cardNumber: card.cardNumberHidden,
//               expiryDate: card.expiracyDate,
//               cardHolderName: card.cardHolderName,
//               cvvCode: card.cvv,
//               showBackView: false,
//               onCreditCardWidgetChange: ( CreditCardBrand ) {},
//             ),
//           ),
//           const Positioned(
//             bottom: 0,
//             child: TotalPayButton(),
//           )
//         ],
//       )
//    );
//   }
// }