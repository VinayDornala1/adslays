// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_credit_card/credit_card_widget.dart';
//
// import '../blocs/pay/pay_bloc.dart';
// import '../data/cards.dart';
// import '../helpers/helpers.dart';
// import '../services/stripe_service.dart';
// import '../widgets/total_pay_button.dart';
// import 'card_page.dart';
//
//
// class HomePage extends StatelessWidget {
//
//   final stripeService = StripeService();
//
//   HomePage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final payBloc = BlocProvider.of<PayBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text( 'Pay' )),
//         actions: [
//           IconButton(
//             icon: const Icon( Icons.add ),
//             onPressed: () async {
//               // await Future.delayed( const Duration( seconds: 1 ) );
//               // showAlert(context, 'hello', 'world');
//               showLoading(context);
//               final amount = payBloc.state.amount;
//               final currency = payBloc.state.currency;
//               final resp = await stripeService.payWithNewCard(
//                 amount: amount,
//                 currency: currency
//               );
//               Navigator.pop(context);
//               if ( resp.ok ) {
//                 showAlert(context, 'Credit Card ok', 'Success Payment');
//               } else {
//                 showAlert(context, 'Upsssss!', resp.msg!);
//               }
//             },
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           Positioned(
//             width: size.width,
//             height: size.height,
//             top: 200,
//             child: PageView.builder(
//               controller: PageController(
//                 viewportFraction: 0.9,
//               ),
//               physics: const BouncingScrollPhysics(),
//               itemCount: cards.length,
//               itemBuilder: ( _, i ) {
//                 final card = cards[i];
//                 return GestureDetector(
//                   child: Hero(
//                     tag: card.cardNumber,
//                     child: CreditCardWidget(
//                       cardNumber: card.cardNumberHidden,
//                       expiryDate: card.expiracyDate,
//                       cardHolderName: card.cardHolderName,
//                       cvvCode: card.cvv,
//                       showBackView: false,
//                       onCreditCardWidgetChange: ( CreditCardBrand ) {},
//                     ),
//                   ),
//                   onTap: () {
//                     payBloc.add( OnSelectCardEvent( card ) );
//                     Navigator.push(context, navigationFadeIn(context, const CardPage()));
//                   },
//                 );
//               } ,
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