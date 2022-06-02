import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'CartScreen.dart';
import 'Constant/ConstantsColors.dart';
import 'MainScreen.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartScreen()));
                    },
                    child: Card(
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
                          MainScreen.cartItemsCount > 0 ?Positioned(
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration:  BoxDecoration(
                                  color: ConstantColors.appTheme,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                //color: Colors.red,
                                child:  Center(
                                  child: Text(
                                    ""+MainScreen.cartItemsCount.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: "Mont-Regular"
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ):const SizedBox(height: 1,width: 1,)
                        ],
                      ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Center(
                            child: Image.asset(
                              "assets/images/aboutus1.png",
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height * 0.70,
                              width: MediaQuery.of(context).size.width  * 0.99,

                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                width: 180,
                                height: 45,
                                decoration:  BoxDecoration(
                                    gradient:  LinearGradient(
                                      colors: [
                                        ConstantColors.appTheme,
                                        ConstantColors.appTheme,
                                      ],
                                    )
                                ),
                                //padding: const EdgeInsets.all(10.0),
                                child: const Center(
                                  child: Text(
                                    "VIEW AD SPACES",
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
