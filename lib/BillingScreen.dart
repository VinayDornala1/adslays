import 'package:flutter/material.dart';

import 'Constant/ConstantsColors.dart';


class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              left: false,
              top: true,
              right: false,
              bottom: false,
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Image.asset(
                                  "assets/images/back.png",
                                  width: 45,
                                  height: 65,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, right: 30, left: 10),
                                child: Image.asset(
                                  "assets/images/home-logo.png", width: 130,)
                            ),
                            const Spacer(),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    22), // if you need this
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: 44,
                                    height: 44,

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                                    child: Image.asset(
                                      "assets/images/cart.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    22), // if you need this
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: 44,
                                    height: 44,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 12, 5, 0),
                                    child: Image.asset(
                                      "assets/images/search.png",
                                      width: 23,
                                      height: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Image.asset(
                                  "assets/images/userprofile.png",
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  "Yashwanth Puvvada",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                    "Unique ID: 11720",
                                  style: TextStyle(
                                    //fontWeight: FontWeight.w700,
                                    fontFamily: 'Mont-SemiBold',
                                    fontSize: 14,
                                    color: ConstantColors.appTheme,
                                  ),

                                ),
                              ],
                            ),

                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: SizedBox(
          //     child: Stack(
          //       children: [
          //         Column(
          //           children: [
          //             ClipRRect(
          //               borderRadius: BorderRadius.circular(10.0),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(0.0),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children:  [
          //                     Container(
          //                       color: Colors.transparent,
          //                       height: 125,
          //                       child: Stack(
          //                         children: [
          //                           ClipRRect(
          //                             borderRadius: BorderRadius.circular(10.0),
          //                             child: Padding(
          //                               padding: const EdgeInsets.only(bottom: 15.0),
          //                               child: Card(
          //                                   elevation: 2,
          //                                   child: Column(
          //                                     crossAxisAlignment: CrossAxisAlignment.start,
          //                                     mainAxisAlignment: MainAxisAlignment.start,
          //                                     children:  [
          //                                       Padding(
          //                                         padding: const EdgeInsets.fromLTRB(10, 15, 5, 5),
          //                                         child: Row(
          //                                           children: const [
          //                                             Text(
          //                                               "Subtotal: ",
          //                                               style: TextStyle(
          //                                                 fontSize: 20,
          //                                                 fontWeight: FontWeight.bold,
          //                                                 color: Colors.blue,
          //                                               ),
          //
          //                                             ),
          //                                             Text(
          //                                               "\$56.00 USD",
          //                                               style: TextStyle(
          //                                                 fontSize: 20,
          //                                                 fontWeight: FontWeight.w500,
          //                                                 color: Colors.black,
          //                                               ),
          //
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                       const Padding(
          //                                         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //                                         child: Text(
          //                                           "Taxes and shipping caculated at checkout",
          //                                           style: TextStyle(
          //                                             fontSize: 14,
          //                                             fontWeight: FontWeight.w500,
          //                                             color: Colors.black,
          //                                           ),
          //
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   )),
          //                             ),
          //                           ),
          //                           Positioned(
          //                             //top: 0,
          //                             left: 0,
          //                             right: 0,
          //                             bottom: 0,
          //                             child: Padding(
          //                               padding: const EdgeInsets.only(top: 10),
          //                               child: MaterialButton(
          //                                 onPressed: () {
          //                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> BillingScreen()));
          //                                 },
          //                                 textColor: Colors.white,
          //                                 padding: const EdgeInsets.all(0.0),
          //                                 child: Container(
          //                                   width: MediaQuery.of(context).size.width * 0.60,
          //                                   height: 45,
          //                                   decoration:  const BoxDecoration(
          //                                       gradient:  LinearGradient(
          //                                         colors: [
          //                                           Color(0xff3962cb),
          //                                           Color(0xff3962cb),
          //                                         ],
          //                                       )
          //                                   ),
          //                                   //padding: const EdgeInsets.all(10.0),
          //                                   child: const Center(
          //                                     child: Text(
          //                                       "CHECK OUT",
          //                                       textAlign: TextAlign.center,
          //                                       style: TextStyle(
          //                                           color: Color(0xFFFFFFFF),
          //                                           fontSize: 16,
          //                                           fontWeight: FontWeight.w500,
          //                                           fontFamily: "Lorin"
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                           const SizedBox(height: 10,),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10,
          //               child: Container(
          //                 color: Colors.transparent,
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
