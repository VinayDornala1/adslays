import 'package:adslay/ChoosePlan.dart';
import 'package:flutter/material.dart';

import 'CartScreen.dart';



class UploadFiles extends StatefulWidget {
  const UploadFiles({Key? key}) : super(key: key);

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
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
                                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                                child: Image.asset(
                                  "assets/images/cart.png",
                                  width: 30,
                                  height: 30,
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
                                fit: BoxFit.fill
                                ,
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
                SizedBox(
                  //height: 220,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 80),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                  child: Container(
                                    height: 230,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 80),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Upload your files or Browse",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                            ),

                                          ),
                                        ),
                                        // SizedBox(height: 40),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    enabledBorder: const UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey),
                                                    ),
                                                    focusedBorder: const UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey),
                                                    ),
                                                    filled: true,
                                                    fillColor: Color(0xFFFFFFFF),
                                                    hintText: 'Select start date',
                                                    suffixIcon:  Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                                      child: const Image(
                                                        image: AssetImage(
                                                          'assets/images/calender.png',
                                                        ),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80), // if you need this
                          ),
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: 160,
                                height: 160,
                                child: Image.asset(
                                  "assets/images/uploadfiles.png",
                                  fit: BoxFit.cover,
                                  height: 160,
                                  width: 160,
                                ),

                              ),

                            ],
                          ),
                        ),
                      ),

                      Positioned(
                          //top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
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
                                    "BOOK NOW",
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
                  ),
                ),
                const SizedBox(height: 50),
              ]),
        ),
      ),
    );
  }
}
