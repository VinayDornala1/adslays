import 'dart:convert';

import 'package:adslay/Constant/ConstantsColors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'API.dart';
import 'BillingScreen.dart';
import 'ChoosePlan.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool isLoading = true;
  List<dynamic> cartList = [];

  String email = '';
  String mobileNumber = '';

  Future<void> getdata() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
      });
    }catch(e){
      print(e);
    }
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
    print('Cart items response :' + response.body.toString());
    setState(() {
      cartList = jsonDecode(response.body)['CartList'];
    });

    setState(() {
      isLoading=false;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              left: false,
              top: true,
              right: false,
              bottom: false,
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                    padding: const EdgeInsets.only(
                                        top: 0, right: 30, left: 10),
                                    child: Image.asset(
                                      "assets/images/home-logo.png", width: 130,)
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                          ],
                        ),
                        _cartItems(),
                        const SizedBox(height: 140,),
                      ]),
                ],
              ),
            ),
          ),
          isLoading
              ?const SizedBox(height: 20,width: 20)
              :Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              child: Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                              Container(
                                color: Colors.transparent,
                                height: 125,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15.0),
                                        child: Card(
                                          elevation: 2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children:  [
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(10, 15, 5, 5),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Subtotal: ",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.blue,
                                                        ),

                                                      ),
                                                      Text(
                                                        "\$56.00 USD",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.black,
                                                        ),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                  child: Text(
                                                    "Taxes and shipping caculated at checkout",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black,
                                                    ),

                                                  ),
                                                ),
                                              ],
                                            )),
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> BillingScreen()));
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
                                                "CHECK OUT",
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
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _cartItems() {
    return isLoading
        ? Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      enabled: true,
      child: Column(
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
                      Image.asset(
                        "assets/images/desibg.png",
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
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
                        height: 40,
                        width: 40,
                      ))

                ],
              ),
            ),
          ]
      )
    )
        : ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: cartList.length,
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
                        //NetworkImage(cartList[index]["ImageUrl"]),
                        Image.network(
                          cartList[index]["ImageUrl"],
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
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
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children:  [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 5, 8),
                    child: Text(
                      "\$" + cartList[index]["ActualPrice"].toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Spacer(),
                  (cartList[index]["ImageUrl"] == "")?const SizedBox(height: 0,width: 0,):Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                    child: Text(
                      "UPLOADED AD!",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: ConstantColors.appTheme,
                      ),
                    ),
                  ),
                  (cartList[index]["ImageUrl"] == "")?const SizedBox(height: 0,width: 0,):Padding(
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
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "SCREEN SIZE",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        ''+ cartList[index]["ScreenSize"].toString(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "NO OF TIMES",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        ''+ cartList[index]["NoofTimes"].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "TOTAL",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "\$" + cartList[index]["ActualPrice"].toString(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ]
        );
      },
    );
  }

}
