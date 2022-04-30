import 'package:flutter/material.dart';

import 'Constant/ConstantsColors.dart';
import 'ThankYouScreen.dart';


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
          SafeArea(
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
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  21.5), // if you need this
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 43,
                                  height: 43,

                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(7, 10, 5, 0),
                                  child: Image.asset(
                                    "assets/images/cart.png",
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  21.5), // if you need this
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 43,
                                  height: 43,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 10, 5, 0),
                                  child: Image.asset(
                                    "assets/images/search.png",
                                    width: 25,
                                    height: 25,
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
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              const Text(
                                "Yashwanth Puvvada",
                                style: TextStyle(
                                  fontFamily: "Mont-SemiBold",
                                  fontSize: 17,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text(
                                    "Unique ID: 11720",
                                  style: TextStyle(
                                    fontFamily: 'Mont-Regular',
                                    fontSize: 14,
                                    color: ConstantColors.appTheme,
                                  ),

                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Divider(
                          thickness: 5,
                          height: 10,
                          color: ConstantColors.lightGrey,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "BILLING ADDRESS",
                                  style: TextStyle(
                                    fontFamily: "Mont-SemiBold",
                                    fontSize: 17,
                                  ),
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: TextField(

                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Enter Your Name',

                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: TextField(

                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Enter Company Name',

                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: TextField(

                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Enter Your Address',

                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  const [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          hintText: 'Select City',
                                          suffixIcon:  Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          hintText: 'Select State',
                                          suffixIcon:  Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  const [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          hintText: 'Select Country',
                                          suffixIcon:  Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          hintText: 'Enter Zip Code ',

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Image.asset(
                                          "assets/images/desilogo.png",
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children:  [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                              child: Text(
                                                "Desi District - Riverside Dr, Irving, TX",
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontFamily: "Mont-SemiBold",
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                const Flexible(

                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 3.0),
                                                    child: Text(
                                                      "Upload AD!: ",
                                                      style: TextStyle(
                                                        fontFamily: 'Mont-Regular',
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                 Flexible(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 3.0),
                                                    child: Text(
                                                      "https://adslay/district/asitrwtq2mnks/jpg",
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        fontFamily: 'Mont-Regular',
                                                        fontSize: 14,
                                                        color: ConstantColors.appTheme,
                                                      ),

                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Divider(
                                  thickness: 5,
                                  height: 10,
                                  color: ConstantColors.lightGrey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 15, 5, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "Subtotal: ",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: "Mont-Regular",
                                        color: ConstantColors.appTheme,
                                      ),

                                    ),
                                    const Text(
                                      "\$56.00 USD",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Mont-Regular",
                                        color: Colors.black,
                                      ),

                                    ),
                                  ],
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  "Taxes and shipping caculated at checkout",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Mont-Light",
                                    color: Colors.black,
                                  ),

                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ThankYouScreen()));
                                    },
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.60,
                                      height: 45,
                                      decoration:  const BoxDecoration(
                                          gradient:  LinearGradient(
                                            colors: [
                                              Color(0xff3962cb),
                                              Color(0xff3962cb),
                                            ],
                                          )
                                      ),
                                      //padding: const EdgeInsets.all(10.0),
                                      child: const Center(
                                        child: Text(
                                          "PROCEED TO PAY",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Lorin"
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ),
                      )
                    ]),
              ],
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
