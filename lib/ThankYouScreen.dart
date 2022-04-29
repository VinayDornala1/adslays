import 'package:flutter/material.dart';

import 'ChoosePlan.dart';
import 'Constant/ConstantsColors.dart';
import 'HomeScreen.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: false,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
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
                          padding: const EdgeInsets.only(top: 0, right: 30,left: 10),
                          child: Image.asset("assets/images/home-logo.png",width: 130,)
                      ),
                      const Spacer(),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22), // if you need this
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
                          borderRadius: BorderRadius.circular(22), // if you need this
                        ),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: 44,
                              height: 44,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 12, 5, 0),
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
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Payment Confirmation",
                style: TextStyle(
                  fontFamily: "Mont-SemiBold",
                  fontSize: 20,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 1.5,
                    height:1.5,
                    color: ConstantColors.appTheme,
                  ),
                ),
              ),

              Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      // height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.40,
                          ),

                          SingleChildScrollView(
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        Image.asset(
                                          'assets/images/success.png',
                                          height: 100,
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'BOOKING CONFIRMED',
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.green,
                                            fontFamily: "Mont-SemiBold",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'THANK YOU FOR BOOKING SERVICE',
                                          style: TextStyle(
                                              fontFamily: "Mont-Light",
                                              fontSize: 19,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 8),
                                          child: Text(
                                            'Thank for choosing us. You would receive you invoice on your registered mail id',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Mont-Light",
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),

                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                          child: SizedBox(
                                            height: 200,
                                            child: Stack(children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(
                                                        Radius.circular(5.0) //
                                                    ),
                                                    border: Border.all(
                                                        color: ConstantColors.appTheme,
                                                        width: 0.7)),
                                                child: Column(
                                                  children: [
                                                    const Spacer(),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 150,
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(10, 0, 0, 0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 8, 10, 5),
                                                                  child: Text(
                                                                    'DATE',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      color:
                                                                      ConstantColors.appTheme,
                                                                      fontFamily: "Mont-Regular",
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 0, 10, 8),
                                                                  child: Text(
                                                                    '12/07/2020',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color:
                                                                        Colors
                                                                            .black,
                                                                      fontFamily: "Mont-Regular",
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 8, 10, 5),
                                                              child: Text(
                                                                'TRANSACTION ID',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color:
                                                                    ConstantColors.appTheme,
                                                                  fontFamily: "Mont-Regular",
                                                                ),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 0, 10, 8),
                                                              child: Text(
                                                                'paymentid',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.black,
                                                                  fontFamily: "Mont-Regular",),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    10, 8, 10, 5),
                                                                child: Text(
                                                                  'STORE',
                                                                  style: TextStyle(
                                                                      fontSize: 14,
                                                                      color:
                                                                      ConstantColors.appTheme,
                                                                    fontFamily: "Mont-Regular",),
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                    10, 0, 10, 8),
                                                                child: Text(
                                                                  'Desi District - Riverside Dr, Irving, TX ',
                                                                  style: TextStyle(
                                                                      fontSize: 14,
                                                                      color:
                                                                      Colors.black,
                                                                    fontFamily: "Mont-Regular",),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 150,
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(10, 0, 0, 0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 8, 10, 5),
                                                                  child: Text(
                                                                    'STATUS',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color:
                                                                        ConstantColors.appTheme,
                                                                      fontFamily: "Mont-Regular",),
                                                                  ),
                                                                ),
                                                                const Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 0, 10, 8),
                                                                  child: Text(
                                                                    'Completed',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors
                                                                            .black,
                                                                      fontFamily: "Mont-Regular",),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 8, 10, 5),
                                                              child: Text(
                                                                'TOTAL',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color:
                                                                    ConstantColors.appTheme,
                                                                  fontFamily: "Mont-Regular",),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 0, 10, 8),
                                                              child: Text(
                                                                '\$ 56.00',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.black,
                                                                  fontFamily: "Mont-Regular",),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),

                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),

                                        
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChoosePlan()));
                                            },
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                              width: 250,
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
                                                    "BACK TO HOME",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Lorin"
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              )


            ]),
      ),
    );
  }
}
