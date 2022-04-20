import 'package:adslay/StoreDetails.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {

  late List<dynamic> storesList;
  bool isLoading = true;

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
                padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
                child: Text(
                  "Grocery Stores",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true, // use it
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.90, //MediaQuery.of(context).size.height / 900,

                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(10, (index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDetails()));
                          },
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDetails()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Card(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    height: MediaQuery.of(context).size.width * 0.40,
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                                      child: CachedNetworkImage(
                                                        imageUrl: "https://image.tmdb.org/t/p/w300_and_h450_bestv2//iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
                                                        placeholder: (context, url) => const Center(
                                                            child: CircularProgressIndicator()),
                                                        errorWidget: (context, url, error) =>
                                                        const Icon(Icons.error),
                                                        fit: BoxFit.contain,
                                                        width: double.infinity,
                                                        height: 150,
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                    const Text(
                                      'Desi District - Riverside',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const Text(
                                      'Dr, Irving, TX',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      ),
                    )
                  ],
                ),
              ),

            ]),
      ),
    );
  }
}
