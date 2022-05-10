import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API.dart';
import 'StoreDetails.dart';
import 'UploadFiles.dart';


class ChoosePlan extends StatefulWidget {

  var storeId;

  ChoosePlan({this.storeId});

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {


  String email = '';
  String mobileNumber = '';
  bool isLoading = true;
  String deviceOS = '';

  int storeId = 0;
  String title = '';
  String city = '';
  String state = '';
  String country = '';
  String zipCode = '';
  String imageUrl = '';
  String screenSize = '';
  int durationInDays = 0;
  double actualPrice = 0.0;
  double offerPrice = 0.0;
  String footTraffic = '';
  String type = '';
  String fileFormat = '';

  String valueChoose = 'Please choose';
  late String selectedScreenSize;
  List screenSizeListItems = [];

  List<dynamic> screenSizeList=[];
  List<dynamic> noOfTimesList=[];
  List<dynamic> storePackagesList=[];


  Future<void> getData() async {

    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
      });
    }catch(e){
      print(e);
    }

    String url1 = APIConstant.getPackageDetails;
    print('Category base StoresList url: '+url1);
    Map<String, dynamic> body = {
      'Mobile': '9160747554',
      'StoreId': widget.storeId.toString(),
    };
    print('Category base StoresList body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print('Category base StoresList response :' + response.body.toString());
    setState(() {
      String msg = jsonDecode(response.body)['msg'];

      if (msg == "Success" || msg == "success")
      {
        title = jsonDecode(response.body)['Title'];
        city = jsonDecode(response.body)['City'];
        state = jsonDecode(response.body)['State'];
        country = jsonDecode(response.body)['Country'];
        zipCode = jsonDecode(response.body)['ZipCode'];
        imageUrl = jsonDecode(response.body)['ImageUrl'];
        screenSize = jsonDecode(response.body)['ScreenSize'];
        durationInDays = jsonDecode(response.body)['DurationinDays'];
        actualPrice = jsonDecode(response.body)['ActualPrice'];
        offerPrice = jsonDecode(response.body)['OfferPrice'];
        footTraffic = jsonDecode(response.body)['FootTraffic'];
        type = jsonDecode(response.body)['Type'];
        fileFormat = jsonDecode(response.body)['FileFormat'];

        screenSizeList = jsonDecode(response.body)['ScreenSizeList'];
        noOfTimesList = jsonDecode(response.body)['NoofTimesList'];
        storePackagesList = jsonDecode(response.body)['StorePackagesList'];

        if (screenSizeList == null) {
        } else {
          for (int i = 0; i < screenSizeList.length; i++) {
            screenSizeListItems.add(screenSizeList[i]['ScreenSize']);
          }
          //print("Screen sizes list :"+screenSizeListItems.toString());
        }

      }else{
        print("Unable to get API response.");
      }

    });

    setState(() {
      isLoading = false;
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
      body: SingleChildScrollView(
        child: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: false,
          child: Column(
              //mainAxisSize: MainAxisSize.max,
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
                 Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 5, 8),
                  child: Text(
                    "$title - $city,$state,$country",
                    maxLines: 2,
                    style: const TextStyle(
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

                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                  elevation: 2.0,
                                  child: Container(
                                    //height: 230,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                                child:
                                                // screenSizeList ==null
                                                //     ?const SizedBox(width: 0,height: 0,)
                                                //     :Padding(
                                                //   padding: const EdgeInsets.fromLTRB(19.0, 5, 19, 0),
                                                //   child: Container(
                                                //     padding: EdgeInsets.only(left: 16, right: 16),
                                                //     decoration: BoxDecoration(
                                                //         border: Border.all(
                                                //             color: const Color(0xFFF2F2F2), width: 1),
                                                //         borderRadius: BorderRadius.circular(13),
                                                //         color: const Color(0xffffffff)),
                                                //     child: DropdownButton(
                                                //       icon: const Icon(
                                                //         Icons.arrow_drop_down_circle_outlined,
                                                //         size: 15,
                                                //       ),
                                                //       dropdownColor: Colors.white,
                                                //       isExpanded: true,
                                                //       underline: const SizedBox(),
                                                //       hint: const Text(
                                                //         'Select Screen Size',
                                                //         style: TextStyle(
                                                //             fontFamily: "Lorin",
                                                //             fontWeight: FontWeight.w100,
                                                //             fontSize: 14.0,
                                                //             color: Colors.grey),
                                                //       ),
                                                //       value: valueChoose,
                                                //       onChanged: (newValue) {
                                                //         setState(() {
                                                //           valueChoose = newValue.toString();
                                                //           for(int i=0;i<screenSizeList.length;i++){
                                                //             if(screenSizeList[i]['ScreenSize']==valueChoose){
                                                //               selectedScreenSize = screenSizeList[i]['ScreenSize'];
                                                //             }
                                                //           }
                                                //         });
                                                //       },
                                                //       items: screenSizeListItems.map((valueItem) {
                                                //         return DropdownMenuItem(
                                                //           value: valueItem,
                                                //           child: Text(
                                                //             valueItem,
                                                //             style: const TextStyle(
                                                //                 fontFamily: "Lorin",
                                                //                 fontWeight: FontWeight.w700,
                                                //                 fontSize: 14.0,
                                                //                 color: Color(0xFF141E28)),
                                                //           ),
                                                //         );
                                                //       }).toList(),
                                                //     ),
                                                //   ),
                                                // ),

                                                TextField(
                                                  decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey),
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey),
                                                      ),
                                                      filled: true,
                                                      fillColor: Color(0xFFFFFFFF),
                                                      hintText: 'Select Screen Size',
                                                      suffixIcon: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 35,
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey),
                                                      ),
                                                      focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey),
                                                      ),
                                                      filled: true,
                                                      fillColor: Color(0xFFFFFFFF),
                                                      hintText: 'Select No Of Times',
                                                      suffixIcon: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 35,
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 40),

                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 5, 8),
                  child: Center(
                    child: Text(
                      "CHOOSE YOUR PLAN",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Card(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.green)// if you need this
                            ),
                            elevation: 2.0,
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.29,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Center(
                                          child:
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Text("1 DAY",style: TextStyle(fontSize: 13),),
                                          )
                                      ),
                                      Center(
                                          child:
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Text(
                                                "\$3.00",
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                )
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                                      child: Image.asset(
                                        "assets/images/tickGreen.png",
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Card(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.grey)// if you need this
                            ),
                            elevation: 2.0,
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.29,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Center(
                                          child:
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Text("1 WEEK",style: TextStyle(fontSize: 13),),
                                          )
                                      ),
                                      Center(
                                          child:
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Text(
                                                "\$21.00",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                )
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                                      child: SizedBox(width: 25, height: 25),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Card(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.grey)// if you need this
                            ),
                            elevation: 2.0,
                            child: SizedBox(
                              height: 75,
                              width: MediaQuery.of(context).size.width * 0.29,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Center(
                                          child:
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Text("1 MONTH",style: TextStyle(fontSize: 13),),
                                          )
                                      ),
                                      Center(
                                          child:
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                            child: Text(
                                                "\$90.00",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                )
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                                      child: SizedBox(width: 25, height: 25),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDetails(storeId: widget.storeId)));
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
                            "CONTINUE BOOKING",
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
              ]),
        ),
      ),
    );
  }
}
