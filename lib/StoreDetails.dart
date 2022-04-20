import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 220,//MediaQuery.of(context).size.width * 0.60,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "assets/images/desibg.png",
                                      fit: BoxFit.contain,
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
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(
                              child: Image.asset(
                                "assets/images/desilogo.png",
                                height: 130,
                                width: 130,
                              ),
                            ),
                          )

                        ],

                      ),
                    ),


                  ],
                ),
              ),

            ]),
      ),
    );
  }
}
