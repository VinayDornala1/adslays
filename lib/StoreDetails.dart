import 'package:adslay/ChoosePlan.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'UploadFiles.dart';


class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 220,//MediaQuery.of(context).size.width * 0.50,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/desibg.png",
                                fit: BoxFit.fill,
                              )
                          ),
                          // Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 220,//MediaQuery.of(context).size.width * 0.60,
                          //     alignment: Alignment.center,
                          //     child: CachedNetworkImage(
                          //       imageUrl: "https://image.tmdb.org/t/p/w300_and_h450_bestv2//iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
                          //       placeholder: (context, url) => const Center(
                          //           child: CircularProgressIndicator()),
                          //       errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          //       fit: BoxFit.cover,
                          //       width: double.infinity,
                          //       // height: 150,
                          //     )
                          // ),s
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Image.asset(
                            "assets/images/desilogo.png",
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      )
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
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              //height: MediaQuery.of(context).size.width * 0.40,
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 5, 8),
                                child: Text(
                                  "ADDITIONAL INFO",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                              width: 150,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 0
                                    , 5, 8),
                                child: Divider(height: 1,color: Color(0xff3962cb),thickness: 1,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Type",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 10, 8),
                                      child: Text(
                                        "Indian Restaurant/Grocery Store Indian Restaurant/Grocery Store",
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Ad Screen",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 10, 8),
                                      child: Text(
                                        "30 Inch Monitor",
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "File Format",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 10, 8),
                                      child: Text(
                                        "jpg - PDF",
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Foor Traffic",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 10, 8),
                                      child: Text(
                                        "30 People per Hour",
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Cost",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Color(0xff3962cb),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 10, 8),
                                      child: Text(
                                        "60 Dollars a Month",
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChoosePlan()));
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 180,
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
                            "BOOK NOW",
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: MaterialButton(
                      onPressed: () { },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 180,
                        height: 45,
                        decoration:  const BoxDecoration(
                            gradient:  LinearGradient(
                              colors: [
                                Color(0xff11abdd),
                                Color(0xff11abdd),
                              ],
                            )
                        ),
                        //padding: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Text(
                            "ADD TO CART",
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
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(18.0),),
                      ),
                      child: Center(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child:
                                        Image.asset("assets/images/facebook.png",fit: BoxFit.cover,)),
                                  ),
                                  const Text(
                                    "SHARE",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),

                            ]
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(18.0),),
                      ),
                      child: Center(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child:
                                        Image.asset("assets/images/twitter.png",fit: BoxFit.cover,)),
                                  ),
                                  const Text(
                                    "TWEET",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),

                            ]
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(18.0),),
                      ),
                      child: Center(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child:
                                        Image.asset("assets/images/pinterest.png",fit: BoxFit.cover,)),
                                  ),
                                  const Text(
                                    "PIN IT ",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),

                            ]
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 40,),
              ]),
        ),
      ),
    );
  }
}
