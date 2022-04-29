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
                                          height: 90,
                                          width: 90,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'BOOKING CONFIRMED',
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'THANK YOU FOR BOOKING SERVICE',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 19,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 8),
                                          child: Text(
                                            'We have recieved your booking for Car Cleaning Service.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                          child: SizedBox(
                                            height: 220,
                                            child: Stack(children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(
                                                        Radius.circular(5.0) //
                                                    ),
                                                    border: Border.all(
                                                        color: ConstantColors.appTheme,
                                                        width: 1.4)),
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
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700),
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
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600),
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
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w700),
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
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                    10, 0, 10, 8),
                                                                child: Text(
                                                                  'types',
                                                                  style: TextStyle(
                                                                      fontSize: 14,
                                                                      color:
                                                                      Colors.black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w600),
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
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700),
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
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600),
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
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w700),
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
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600),
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

                                        const Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 8),
                                          child: Text(
                                            'Thank for choosing us. You would receive you invoice on your registered mail id',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
                                          child: FlatButton(
                                            onPressed: (){
                                              //
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext context) =>
                                                          HomeScreen()),
                                                      (Route<dynamic> route) => false);
                                            },
                                            minWidth: double.infinity,
                                            height: 50,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: const [
                                                
                                                SizedBox(width: 5),
                                                Text(
                                                  'BACK TO HOME',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            color: ConstantColors.appTheme,
                                            textColor: Colors.white,

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
