import 'dart:convert';

import 'package:adslay/API.dart';
import 'package:adslay/BoolProvider.dart';
import 'package:adslay/HistoryScreen.dart';
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

import 'AboutUsScreen.dart';
import 'AllCategoriesScreen.dart';
import 'CartScreen.dart';
import 'ChoosePlan.dart';
import 'Constant/ConstantsColors.dart';
import 'HowItWorks.dart';
import 'LoginScreen.dart';
import 'OrderDetailsScreen.dart';
import 'SearchScreen.dart';
import 'StoreDetails.dart';
import 'StoresList.dart';
import 'bottom_bar.dart';


class MainScreen extends StatefulWidget {

  static int cartItemsCount=0;

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
  List<dynamic> StoresListDict=[];
  List<dynamic> cartList = [];

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
    //print('Home Screen api calling body:' + response.body.toString());
    setState(() {
      MobileBannersList = jsonDecode(response.body)['ThemeBannersList'];
      CategoriesList = jsonDecode(response.body)['CategoriesList'];
      StoresListDict = jsonDecode(response.body)['StoresList'];

    });


    getCartItems();

    setState(() {
      isLoading=false;
    });


  }


  Future<void> getCartItems() async {

    String url1 = APIConstant.getCartItems;
    print("Get cart items url is: "+url1);
    Map<String, dynamic> body = {
      'Mobile': '9160747554',
    };
    print('Get cart items api body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    //print('Cart items response :' + response.body.toString());
    setState(() {
      cartList = jsonDecode(response.body)['CartList'];
      if (cartList.isNotEmpty){
        MainScreen.cartItemsCount = cartList.length;
      } else {
        MainScreen.cartItemsCount = 0;
      }
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
                      isLoading? const SizedBox(height: 0,width: 0,):const Padding(
                        padding: EdgeInsets.fromLTRB(10, 8, 5, 8),
                        child: Text(
                          "Ad Space Categories",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Mont-SemiBold",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      _adSpaceCategories(),
                      isLoading?const SizedBox(height: 0,width: 0,):const Padding(
                        padding: EdgeInsets.fromLTRB(10, 8, 5, 0),
                        child: Text(
                          "Featured Ad Spaces",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Mont-SemiBold",
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
                  _boolProvider.setBottomChange(1);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-stores.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Stores',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
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
                  //_boolProvider.setBottomChange(3);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>HowItWorks()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-how-works.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'How it Works',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                  //     false);
                  // _scaffoldKey.currentState?.openEndDrawer();
                  // _boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/contactus.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
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
                  _boolProvider.setBottomChange(2);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-your-bookings.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'History',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>AboutUsScreen()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-about-us.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'About Us',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                  //     false);
                  // _scaffoldKey.currentState?.openEndDrawer();
                  //_boolProvider.setBottomChange(3);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>TabbarProfile()));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-share-app.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Share App',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  _boolProvider.setBottomChange(0);
                  SharedPreferences preferences =
                  await SharedPreferences
                      .getInstance();
                  await preferences.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder:
                              (BuildContext context) => LoginScreen()),
                      ModalRoute.withName('/'));

                },
                child: Column(
                  children: [
                    Image.asset("assets/images/menu-logout.png",width: 40,height: 40,),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xFF141E28),
                        fontFamily: "Mont-Regular",
                        fontSize: 12,
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
      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
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
                width: 43,
                height: 60,
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
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
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
          ),
        ],
      ),

    );
  }

  Widget _imageSlider() {
    return isLoading
        ? Shimmer.fromColors(
      baseColor: ConstantColors.lightGrey,
      highlightColor: Colors.white,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: ConstantColors.lightGrey,
          ),
          //  height: 180,
          width: double.infinity,
        ),
      ),
    )
        : Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child:
      Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  //X:1125,Pro: 1170,Pro Max: 1284
                    height: 180,
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
                    )
                        :CarouselSlider(
                      items: [
                        for(int i=0;i<MobileBannersList.length;i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                print("Tapped on banner");
                                print("Selected banner details:"+MobileBannersList[i].toString());

                                var actionToBeOpen = MobileBannersList[i]["ActionToBeOpen"];
                                var actionValue = MobileBannersList[i]["ActionValue"].toString();

                                if (actionToBeOpen == "ADSpaceDetails"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetails(storeId: actionValue,)));
                                }else if (actionToBeOpen == "History") {
                                  _boolProvider.setBottomChange(2);
                                  Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation1, animation2) => BottomNavigationMenu(),
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration: Duration.zero,
                                      ),
                                  );
                                }else if (actionToBeOpen == "CompleteOrder") {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailsScreen(cartOrderId: actionValue,)));
                                }

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:NetworkImage(MobileBannersList[i]['BannerUrl'].toString()),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
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
                    ? Shimmer.fromColors(
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
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: MobileBannersList.asMap().entries.map((entry) {
                    return _current == entry.key
                        ? GestureDetector(
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue),
                      ),
                    ):GestureDetector(
                      child: Container(
                        width: 4.0,
                        height: 4.0,
                        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                        decoration: const BoxDecoration(
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
    return isLoading
        ? Shimmer.fromColors(
        baseColor: ConstantColors.lightGrey,
        highlightColor: Colors.white,
        enabled: true,
        child: ListView(
          shrinkWrap: true, // use it
          physics: const BouncingScrollPhysics(),
          children: [
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.90,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(6, (index) {
                return InkWell(
                  child: GestureDetector(
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.width * 0.40,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
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
        )
    )
        : GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: CategoriesList.length,
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
      ),
      itemBuilder: (context, index) {
        return Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){

                  String categoryName = CategoriesList[index]["CategoryName"].toString();

                  if (categoryName == "All" || categoryName == "all") {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategoriesScreen()));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StoresList(categoryId: CategoriesList[index]["CategoryId"].toString(),storeCategory: CategoriesList[index]["CategoryName"])));
                  }


                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Card(
                                    elevation: 2,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height: 140,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(CategoriesList[index]['ImageUrl'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 140,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset(
                                              "assets/images/black-transparent.png",
                                              fit: BoxFit.fill,

                                            ),
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
                                                  fontFamily: "Mont-Regular",
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
                                    )),
                              ),
                            ],
                          ),
                        ),

                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(5.0),
                        //   child: Card(
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Stack(
                        //             children: [
                        //               Container(
                        //                   decoration: BoxDecoration(
                        //                     borderRadius: BorderRadius.circular(5.0),
                        //                   ),
                        //                   width: MediaQuery.of(context).size.width,
                        //                   alignment: Alignment.center,
                        //                   child: Card(
                        //                       shape: const RoundedRectangleBorder(
                        //                         borderRadius: BorderRadius.all(
                        //                           Radius.circular(5.0),
                        //                         ),
                        //                       ),
                        //                       child: Column(
                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                        //                         children: [
                        //                           Container(
                        //                             height: 140,
                        //                             width: MediaQuery.of(context).size.width,
                        //                             child: ClipRRect(
                        //                               borderRadius: BorderRadius.circular(5),
                        //                               child: Image(
                        //                                 fit: BoxFit.fill,
                        //                                 image: NetworkImage(CategoriesList[index]['ImageUrl'],
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       )),
                        //                   // CachedNetworkImage(
                        //                   //   imageUrl: ""+CategoriesList[index]['ImageUrl'],
                        //                   //   placeholder: (context, url) => const Center(
                        //                   //       child: CircularProgressIndicator()),
                        //                   //   errorWidget: (context, url, error) =>
                        //                   //   const Icon(Icons.error),
                        //                   //   fit: BoxFit.fill,
                        //                   //   width: double.infinity,
                        //                   //   height: 150,
                        //                   // )
                        //               ),
                        //               Container(
                        //                 decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(5.0),
                        //                 ),
                        //                 width: MediaQuery.of(context).size.width,
                        //                 height: 150,
                        //                 alignment: Alignment.center,
                        //                 child:  Image.asset(
                        //                   "assets/images/black-transparent.png",
                        //                   fit: BoxFit.fitWidth,
                        //                   width: MediaQuery.of(context).size.width,
                        //
                        //                 ),
                        //               ),
                        //               Positioned(
                        //                 bottom: 0,
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.only(left: 5.0,right:35,bottom: 8),
                        //                   child: Text(
                        //                     ''+CategoriesList[index]['CategoryName'],
                        //                     overflow: TextOverflow.ellipsis,
                        //                     maxLines: 1,
                        //                     style: const TextStyle(
                        //                         fontSize: 14.0,
                        //                         fontFamily: "Mont-Regular",
                        //                         color: Colors.white,
                        //                         fontWeight: FontWeight.normal),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Positioned(
                        //                 bottom: 0,
                        //                 right: 0,
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.only(right: 8.0,bottom: 8),
                        //                   child: Image.asset(
                        //                     "assets/images/right-arrow.png",
                        //                     height: 22,
                        //                     width: 22,),
                        //                 ),
                        //               ),
                        //
                        //             ],
                        //           ),
                        //         ],
                        //       )),
                        // ),

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
  }

  Widget _featuredAdSpace(){
    return isLoading
        ? Shimmer.fromColors(
        baseColor: ConstantColors.lightGrey,
        highlightColor: Colors.white,
        enabled: true,
        child: ListView(
          shrinkWrap: true, // use it
          physics: const BouncingScrollPhysics(),
          children: [
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.99,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                2, (index) {
                return InkWell(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.width * 0.30,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
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
        )
    )
        : SizedBox(
      height: 180.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: StoresListDict.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ChoosePlan(storeId: StoresListDict[index]["StoreId"].toString())));

              },
              child: Padding(
                padding: index == 0
                    ? const EdgeInsets.fromLTRB(10, 5, 0, 5)
                    : const EdgeInsets.fromLTRB(2, 5, 0, 5),
                child: Center(
                  child: SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Card(
                              elevation: 2,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(StoresListDict[index]['ImageUrl'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text(
                            ''+StoresListDict[index]['StoreName']+' - '+StoresListDict[index]['City'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Mont-Regular",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text(
                            ''+StoresListDict[index]['State']+' - '+StoresListDict[index]['Country'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Mont-Regular",
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),              );
          }),
    );
  }
}
