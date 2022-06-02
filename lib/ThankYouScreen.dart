import 'dart:convert';

import 'package:adslay/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'API.dart';
import 'BoolProvider.dart';
import 'Constant/ConstantsColors.dart';


class ThankYouScreen extends StatefulWidget {

  var orderId;

  ThankYouScreen({this.orderId});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  BoolProvider _boolProvider = BoolProvider();

/*
"OrderId": 39,
    "TransactionId": "pi_3L4IxgEeBLujSW5l0GzKI6Ih",
    "OrderCreated": "28/05/2022",
    "PaidAmount": 37555.00,
    "StoreName": "",
    "PaymentStatus": "Completed"
 */

  bool isLoading = true;

  String email = '';
  String mobileNumber = '';
  String username = '';

  String transactionId = '';
  String orderCreated = '';
  String paidAmount = '';
  String storeName = '';
  String paymentStatus = '';


  Future<void> getData() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
        username = prefs.getString('username')!;
      });
    }catch(e){
      print(e);
    }

    String url1 = APIConstant.getOrderPaymentDetails;
    print("Get order payment details body:" +url1);
    Map<String, dynamic> body = {
      'Mobile': '9160747554',
      'OrderId': widget.orderId.toString(),
    };
    print("Get order payment details body:" + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );

    Map data = jsonDecode(response.body);
    print(data);
    String msg = data['msg'];
    print(msg);

    if (msg=='Success' || msg=='success' ) {
      setState(() {

        transactionId = data['TransactionId'].toString();
        orderCreated = data['OrderCreated'];
        paidAmount = data['PaidAmount'].toString();
        storeName = data['StoreName'];
        paymentStatus = data['PaymentStatus'];

      });
    } else {

    }

    setState(() {
      isLoading=false;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigationMenu()));
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

                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Payment Confirmation",
                style: TextStyle(
                  fontFamily: "Mont-SemiBold",
                  fontSize: 20,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 1.5,
                    height:1.5,
                    color: ConstantColors.appTheme,
                  ),
                ),
              ),

              isLoading
                  ?Shimmer.fromColors(
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
                        children: List.generate(2, (index) {
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
                  :Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      // height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.40,
                          ),

                          SingleChildScrollView(
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        Image.asset(
                                          (paymentStatus == "Completed")?'assets/images/success.png':'assets/images/paymentfailed.png',
                                          height: 100,
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          (paymentStatus == "Completed")?'BOOKING CONFIRMED':'BOOKING CANCELLED',
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: (paymentStatus == "Completed")?Colors.green:Colors.red,
                                            fontFamily: "Mont-SemiBold",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                         Text(
                                           (paymentStatus == "Completed")?'THANK YOU FOR BOOKING SERVICE':'YOUR SERVICE BOOKING WAS FAILED',
                                          style: const TextStyle(
                                              fontFamily: "Mont-Light",
                                              fontSize: 19,
                                              color: Colors.black
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                         Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(15, 0, 15, 8),
                                          child: Text(
                                            (paymentStatus == "Completed")?'':'Thank for choosing us. You would receive you invoice on your registered mail id',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: "Mont-Light",
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                        ),

                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                          child: SizedBox(
                                            height: 170,
                                            child: Stack(children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(
                                                        Radius.circular(5.0) //
                                                    ),
                                                    border: Border.all(
                                                        color: ConstantColors.appTheme,
                                                        width: 0.7)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    const Spacer(),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 150,
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(10, 0, 0, 0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 8, 10, 5),
                                                                  child: Text(
                                                                    'DATE',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      color:
                                                                      ConstantColors.appTheme,
                                                                      fontFamily: "Mont-Regular",
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 0, 10, 8),
                                                                  child: Text(
                                                                    '' + orderCreated,
                                                                    style:const  TextStyle(
                                                                        fontSize: 14,
                                                                        color:
                                                                        Colors
                                                                            .black,
                                                                      fontFamily: "Mont-Regular",
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .fromLTRB(
                                                                    10, 8, 10, 5),
                                                                child: Text(
                                                                  'TRANSACTION ID',
                                                                  style: TextStyle(
                                                                      fontSize: 14,
                                                                      color:
                                                                      ConstantColors.appTheme,
                                                                    fontFamily: "Mont-Regular",
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .fromLTRB(
                                                                    10, 0, 10, 8),
                                                                child: Text(
                                                                  '' + transactionId,
                                                                  maxLines: 2,
                                                                  style: const TextStyle(
                                                                      fontSize: 14,
                                                                      color: Colors.black,
                                                                    fontFamily: "Mont-Regular",),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),


                                                    Spacer(),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 150,
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(10, 0, 0, 0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 8, 10, 5),
                                                                  child: Text(
                                                                    'STATUS',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        color:
                                                                        ConstantColors.appTheme,
                                                                      fontFamily: "Mont-Regular",),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      10, 0, 10, 8),
                                                                  child: Text(
                                                                    '' + paymentStatus,
                                                                    style: const TextStyle(
                                                                        fontSize: 14,
                                                                        color: Colors
                                                                            .black,
                                                                      fontFamily: "Mont-Regular",),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 8, 10, 5),
                                                              child: Text(
                                                                'TOTAL',
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color:
                                                                    ConstantColors.appTheme,
                                                                  fontFamily: "Mont-Regular",),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 0, 10, 8),
                                                              child: Text(
                                                                '\$ $paidAmount',
                                                                style: const TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.black,
                                                                  fontFamily: "Mont-Regular",),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),

                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),

                                        
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
                                          child: MaterialButton(
                                            onPressed: () {
                                              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigationMenu()));

                                              Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
                                                  false);
                                              _scaffoldKey.currentState?.openEndDrawer();
                                              _boolProvider.setBottomChange(0);
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) =>BottomNavigationMenu()));

                                            },
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                              width: 250,
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
                                                    "BACK TO HOME",
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

                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              )

            ]),
      ),
    );
  }
}
