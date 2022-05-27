import 'dart:convert';

import 'package:adslay/Constant/ConstantsColors.dart';
import 'package:adslay/StoreDetails.dart';
import 'package:adslay/UploadFiles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'API.dart';
import 'BillingScreen.dart';
import 'ChoosePlan.dart';
import 'MainScreen.dart';
import 'SearchScreen.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  bool isLoading = true;
  bool isCheckoutAvailable = false;
  List<dynamic> cartList = [];

  String email = '';
  String mobileNumber = '';
  double subTotalValue = 0.0;

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

      if (cartList.isNotEmpty){
        MainScreen.cartItemsCount = cartList.length;
      } else {
        MainScreen.cartItemsCount = 0;
      }
    });

    if (cartList.isEmpty) {
      print("No cart items found");
      isCheckoutAvailable = false;
    }
    else{
      subTotalValue = 0.0;
      for (var item in cartList) {
        double actualPrice = item["ActualPrice"];
        subTotalValue += actualPrice;
        //print("Cart items actual prices are: "+actualPrice.toString());
      }
      isCheckoutAvailable = true;
      print("Cart items total price: "+subTotalValue.toString());
    }


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

    pr = ProgressDialog(context);
    pr.style(
        message: 'Loading',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
            padding: const EdgeInsets.all(10.0),
            child: const CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600)
    );
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            left: false,
            top: true,
            right: false,
            bottom: false,
            child: Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
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
                                child: GestureDetector(
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _cartItems(),
                                    const SizedBox(height: 140,),
                                  ]
                              );
                            },
                      ))

                    ]),
              ],
            ),
          ),
          isLoading
              ?const SizedBox(height: 20,width: 20)
              :isCheckoutAvailable
              ?Positioned(
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
                                height: 130,
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
                                                    children: [
                                                      const Text(
                                                        "Subtotal: ",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.blue,
                                                        ),

                                                      ),
                                                      Text(
                                                        "\$" + subTotalValue.toString(),
                                                        style: const TextStyle(
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
                                      bottom: 8,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: MaterialButton(
                                          onPressed: () {
                                            //Check out
                                            int j=0;
                                            for(int i=0;i<cartList.length;i++){
                                              if(cartList[i]['IsFileUpload']=='Yes'){
                                                j=j+1;
                                              }
                                            }
                                            if(j==cartList.length) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BillingScreen(
                                                              total: subTotalValue
                                                                  .toString())));
                                            }else{
                                              for(int i=0;i<cartList.length;i++){
                                                if(cartList[i]['IsFileUpload']=='Yes'){

                                                }else{
                                                  //show popup
                                                  _showUploadFilesPopUp();
                                                }
                                              }
                                            }
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
          ) :const SizedBox(height: 20,width: 20),
        ],
      ),
    );
  }


  Widget _cartItems() {
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
              crossAxisCount: 1,
              childAspectRatio: 1.5,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(10, (index) {
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
        : cartList.isEmpty?Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 40),
                  child: Image.asset("assets/images/nocartitems.png",width: 300,height: 350,),
                ),
              ],
            )):ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: cartList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadFiles(cartDetailId: cartList[index]["CartDetailId"].toString())));
          },
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
                          //NetworkImage(cartList[index]["ImageUrl"]),
                          Card(
                            elevation: 1,
                            child: Image.network(
                              cartList[index]["ImageUrl"],
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Image.network(
                          //   cartList[index]["ImageUrl"],
                          //   height: 160,
                          //   width: MediaQuery.of(context).size.width,
                          //   fit: BoxFit.cover,
                          // ),
                        ],
                      ),

                      Positioned(
                          top: 10,
                          right: 8,
                          child: GestureDetector(
                            onTap: (){
                              _deleteAdFromCart(cartList[index]["CartDetailId"]);
                            },
                            child: Image.asset(
                              "assets/images/delete.png",
                              fit: BoxFit.contain,
                              height: 45,
                              width: 45,
                            ),
                          ))

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 5, 8),
                  child: Text(
                    "" + cartList[index]["StoreName"] +", "+ cartList[index]["City"] +", "+ cartList[index]["State"],
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children:  [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                      child: Text(
                        // "\$" + cartList[index]["ActualPrice"].toString(),
                        "",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const Spacer(),
                    (cartList[index]["IsFileUpload"] == "No" || cartList[index]["IsFileUpload"] == "")
                        ?const SizedBox(height: 0,width: 0,)
                        :const Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                      child: Text(
                        "UPLOADED AD!",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    (cartList[index]["IsFileUpload"] == "No" || cartList[index]["IsFileUpload"] == "")
                        ?const SizedBox(height: 0,width: 0,)
                        :Padding(
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
                                    children:  [
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Text(
                                          "AD TYPE",
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
                                          "" + cartList[index]["ScreenSize"].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                          const Spacer(),
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
                                    children:  [
                                      const Padding(
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
                                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Text(
                                          "" + cartList[index]["NoofTimes"].toString() + " Times",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                          const Spacer(),
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
                                    children:  [
                                      const Padding(
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
                                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Text(
                                          // "\$21.00",
                                          "\$" + cartList[index]["ActualPrice"].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                          const Spacer(),
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
          ),
        );
      },
    );
  }

  late ProgressDialog pr;

  Future<void> _deleteAdFromCart(cartId) async {
    await pr.show();
    String url1 = APIConstant.deleteCartItem;
    print("Delete cart items url is: " + url1);
    Map<String, dynamic> body = {
      'CartDetailId': cartId.toString(),
    };
    await pr.hide();
    print('Delete cart item api body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print('Delete cart item response :' + response.body.toString());
    setState(() {
      isLoading = true;
      getdata();
    });
  }


  _showUploadFilesPopUp() {

    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                            child: Center(
                              child: Text(
                                'Give us your valuable feedback.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Lorin',
                                    color: Color(0xFF0063AD),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12,top: 20),
                                child: GestureDetector(
                                  onTap: (){

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 35,width: 120,

                                    decoration: BoxDecoration(
                                      color: ConstantColors.appTheme,
                                      borderRadius: BorderRadius.circular(10),
                                      // border: Border.all(
                                      //     color: Color(0xffAAAAAA)
                                      // ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left:0),
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontFamily: "lorin",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12,top: 20),
                                child: GestureDetector(
                                  onTap: (){
                                    //Navigate to uplod files screen
                                  },
                                  child: Container(
                                    height: 35,width: 120,

                                    decoration: BoxDecoration(
                                      color: ConstantColors.lightYellow,
                                      borderRadius: BorderRadius.circular(10),
                                      // border: Border.all(
                                      //     color: Color(0xffAAAAAA)
                                      // ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left:0),
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                              fontFamily: "lorin",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

}
