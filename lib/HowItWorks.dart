import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'Constant/ConstantsColors.dart';


class HowItWorks extends StatefulWidget {
  const HowItWorks({Key? key}) : super(key: key);

  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        top: true,
        right: false,
        bottom: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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

              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/howitworks.png",
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Divider(height: 2,thickness: 5,color: ConstantColors.lightGrey,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: ConstantColors.lightGrey,
                                      blurRadius: 10.0,
                                    ),
                                  ]
                              ),
                              height: 100,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.91,
                                    child: Image.asset("assets/images/sharebg.png"),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 10,),
                                      Image.asset(
                                        "assets/images/share.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GradientText(
                                              "Share With Friends",
                                              style: const TextStyle(
                                                  fontFamily: "Mont-Bold",
                                                  fontSize: 20
                                              ),
                                              colors: const [
                                                Colors.red,
                                                Colors.orange,
                                              ]
                                          ),
                                          const Text(
                                            "Help your friends to share the app",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: "Mont-Regular"
                                            ),
                                          ),
                                          const Text(
                                            "Make ads to improve business       ",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: "Mont-Regular"
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              )

            ]),
      ),
    );
  }
}
