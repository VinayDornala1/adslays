import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constant/ConstantsColors.dart';

class HistoryScreen extends StatefulWidget {

  @override
  _HistoryScreen createState() => _HistoryScreen();

}

class _HistoryScreen extends State<HistoryScreen> {


  @override
  void initState() {
    // TODO: implement initState
    //SystemChannels.textInput.invokeMethod('TextInput.hide');


    super.initState();
  }

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Orders History",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Mont-SemiBold"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                child: SizedBox(width: 100,child: Divider(height: 1,thickness: 1,color: ConstantColors.appTheme,),),
              ),

              Expanded(
                child: SingleChildScrollView(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,//cartList.length,
                      itemBuilder: (context, index) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            "assets/images/desibg.png",
                                            height: 160,
                                            width: MediaQuery.of(context).size.width,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/desilogo.png",
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 8,
                                        child: Image.asset(
                                          "assets/images/delete.png",
                                          fit: BoxFit.fill,
                                          height: 45,
                                          width: 45,
                                        ))

                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 5, 8),
                                child: Text(
                                  "Desi District - Riverside Dr, Irving, TX",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Mont-SemiBold'
                                  ),
                                ),
                              ),
                              Row(
                                children:  [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                                    child: Text(
                                      "\$3.00",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Mont-Regular',
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                                    child: Text(
                                      "UPLOAD AD!",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontFamily: 'Mont-Regular',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: Image.asset(
                                      "assets/images/link.png",
                                      fit: BoxFit.fill,
                                      height: 20,
                                      width: 20,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Card(
                                    elevation: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                          child: SizedBox(
                                            height: 75,
                                            //width: MediaQuery.of(context).size.width * 0.23,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                      child: Text(
                                                        "SCREEN SIZE",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: 'Mont-Regular',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                      child: Text(
                                                        "40 Inch",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Mont-SemiBold',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: SizedBox(
                                            height: 75,
                                            //width: MediaQuery.of(context).size.width * 0.23,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                      child: Text(
                                                        "NO OF TIMES",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: 'Mont-Regular',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                      child: Text(
                                                        "2 Times",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Mont-SemiBold',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: SizedBox(
                                            height: 75,
                                            //width: MediaQuery.of(context).size.width * 0.19,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                      child: Text(
                                                        "TOTAL",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: 'Mont-Regular',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                      child: Text(
                                                        "\$21.00",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Mont-SemiBold',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                                          child: Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  24), // if you need this
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  color: Colors.transparent,
                                                  width: 48,
                                                  height: 48,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(5,8,5,0),
                                                  child: Image.asset(
                                                    "assets/images/blueRightArrow.png",
                                                    width: 35,
                                                    height: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        );
                      },
                    )
                ),
              )

            ]),
      ),
    );
  }


}
