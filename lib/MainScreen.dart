import 'dart:convert';

import 'package:adslay/API.dart';
import 'package:adslay/BoolProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io' show Platform;
import 'dart:ui';

import 'StoreDetails.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  BoolProvider _boolProvider = BoolProvider();
  int _currentIndex = 0;
  String Email='';
  String MobileNo='';
  bool isLoading = true;
  String deviceOS='';
  double screenWidth=0.0;
  List<dynamic> MobileBannersList=[];
  List<dynamic> CategoriesList=[];
  List<dynamic> StoresList=[];
  String mobileNumber='';
  String email='';
  int _current = 0;

  Future<void> getdata() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
      });
    }catch(e){

    }
    String url1 = APIConstant.home;
    print(url1);
    Map<String, dynamic> body = {
      'MobileNo': '9160747554',
    };
    print('Home Screen api calling :' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print('Home Screen api calling :' + response.body.toString());
    setState(() {
      MobileBannersList = jsonDecode(response.body)['ThemeBannersList'];
      CategoriesList = jsonDecode(response.body)['CategoriesList'];
      StoresList = jsonDecode(response.body)['StoresList'];

    });

    setState(() {
      isLoading=false;
    });


  }



  @override
  void initState() {
    super.initState();
    // _boolProvider = Provider.of<BoolProvider>(context, listen: false);

    // if (Platform.isAndroid) {
    //   // Android-specific code
    //   deviceOS = "Android";
    // } else if (Platform.isIOS) {
    //   // iOS-specific code
    //   deviceOS = "IOS";
    // }
    // var physicalScreenSize = window.physicalSize;
    // var physicalWidth = physicalScreenSize.width;
    // var physicalHeight = physicalScreenSize.height;
    // //screenWidth = MediaQuery.of(context).size.width;
    // print("Device screen screen size is:" + physicalScreenSize.toString());
    // print("Device screen width is:" + physicalWidth.toString());
    // print("Device screen height is:" + physicalHeight.toString());
    // screenWidth = physicalWidth;
    getdata();

  }


  @override
  Widget build(BuildContext context) {
    _boolProvider  =  Provider.of<BoolProvider>(context,);
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(),
      onDrawerChanged: (isOpen) {
        if (isOpen == true) {
          Provider.of<BoolProvider>(context , listen : false).setNoBookmarks(isOpen);
        } else if (isOpen == false) {
          Provider.of<BoolProvider>(context , listen : false).setNoBookmarks(isOpen);
        }
      },
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 13,
              ),
              _appBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _imageSlider(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
                        child: Text(
                          "Ad Space Categories",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Mont-Bold",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      _adSpaceCategories(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
                        child: Text(
                          "Featured Ad Spaces",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Mont-Bold",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      _featuredAdSpace(),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _drawer() {
    return Container(
      width: 100,

      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-stores.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Stores',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-how-works.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'How it Works',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-notifications.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-your-bookings.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Your Bookings',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-about-us.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'About Us',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-share-app.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Share App',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                      false);
                  _scaffoldKey.currentState?.openEndDrawer();
                  _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-logout.png",width: 30,height: 30,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 24, 0),
      child:
      Row(
        children: [
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                "assets/images/menu.png",
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  22), // if you need this
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
              borderRadius: BorderRadius.circular(
                  22), // if you need this
            ),
            child: Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  width: 44,
                  height: 44,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      10, 12, 5, 0),
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

    );
  }

  Widget _imageSlider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child:
      Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  //X:1125,Pro: 1170,Pro Max: 1284
                    height: 160,
                    width: double.infinity,
                    child: isLoading
                        ?Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey,
                      enabled: true,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            //  height: 180,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ): CarouselSlider(
                      items: [
                        for(int i=0;i<MobileBannersList.length;i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:NetworkImage(MobileBannersList[i]['BannerUrl'].toString()),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                //  height: 180,
                                width: double.infinity,
                              ),
                            ),
                          ),
                      ],
                      options: CarouselOptions(
                          height: 400,
                          viewportFraction: 1.0,
                          initialPage: 0,
                          reverse: false,
                          autoPlay: true,
                          aspectRatio: 5.0,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    )),
                isLoading
                    ?Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey,
                  enabled: true,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        //  height: 180,
                        // width: double.infinity,
                      ),
                    ),
                  ),
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: MobileBannersList.asMap().entries.map((entry) {
                    return _current == entry.key
                        ? GestureDetector(
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue),
                      ),
                    ):GestureDetector(
                      child: Container(
                        width: 4.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget _adSpaceCategories(){
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: CategoriesList.length,
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
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
                                    Stack(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context).size.width,
                                            alignment: Alignment.center,
                                            child: CachedNetworkImage(
                                              imageUrl: ""+CategoriesList[index]['ImageUrl'],
                                              placeholder: (context, url) => const Center(
                                                  child: CircularProgressIndicator()),
                                              errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                              height: 150,
                                            )
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 150,
                                          alignment: Alignment.center,
                                          child:  Image.asset(
                                            "assets/images/black-transparent.png",
                                            fit: BoxFit.fitWidth,
                                            width: MediaQuery.of(context).size.width,

                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5.0,right:35,bottom: 8),
                                            child: Text(
                                              ''+CategoriesList[index]['CategoryName'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 14.0,

                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                                            child: Image.asset(
                                              "assets/images/right-arrow.png",
                                              height: 22,
                                              width: 22,),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    // return ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   physics: BouncingScrollPhysics(),
    //   itemCount: CategoriesList.length,
    //   itemBuilder: (context, index) {
    //     return  GridView.count(
    //       crossAxisCount: 2,
    //       childAspectRatio: 0.90, //MediaQuery.of(context).size.height / 900,
    //       physics: const ScrollPhysics(),
    //       shrinkWrap: true,
    //       children: List.generate(10, (index) {
    //         return InkWell(
    //           onTap: (){
    //             Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDetails()));
    //           },
    //           child:
    //         );
    //       },
    //       ),
    //     )
    //     ;
    //   },
    // );

  }

  Widget _featuredAdSpace(){
    return isLoading
        ? Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      enabled: true,
      child: Container(
          height: 244.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                  child: Card(
                    shadowColor: Color(0xFF000000).withOpacity(0.08),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0)),
                    elevation: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137.0,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(14.0),
                                topLeft: Radius.circular(14.0)),
                          ),
                          child: Container(
                            height: 137.0,
                            width: 320,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Color(0xFFC4C4C4).withOpacity(0.0),
                                    Color(0xFF0063AD).withOpacity(0.7),
                                  ],
                                  stops: [
                                    0.0,
                                    1.0
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14.0),
                                  topLeft: Radius.circular(14.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color:
                                  Color(0xFF141E28).withOpacity(1.0),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontFamily: "Lorin",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Lorin",
                                            color: Color(0xFF141E28)
                                                .withOpacity(.45),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Lorin",
                                            color: Color(0xFF0063AD)
                                                .withOpacity(1.0),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    )
        : Container(
      height: 150.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: StoresList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CourseOverview(
                //             UniversityCourseId: ReadytoApply[index]
                //             ['UniversityCourseId']
                //                 .toString())));

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
                              width: 180,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,

                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        child: CachedNetworkImage(
                                          imageUrl: StoresList[index]['ImageUrl'],
                                          placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Text(
                        ''+StoresList[index]['StoreName']+' - '+StoresList[index]['City'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),Text(
                      ''+StoresList[index]['State']+' - '+StoresList[index]['Country'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                    ),

                    ],
                  ),
                ),
              ),              );
          }),
    );
  }
}
