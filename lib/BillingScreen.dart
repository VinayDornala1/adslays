import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API.dart';
import 'Constant/ConstantsColors.dart';
import 'ThankYouScreen.dart';


class BillingScreen extends StatefulWidget {

  var total;

  BillingScreen({this.total});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {


  bool isLoading = true;
  bool isCheckoutAvailable = false;
  List<dynamic> ordersHistoryList = [];
  List<dynamic> userDetails = [];

  String email = '';
  String mobileNumber = '';
  String username = '';
  int userid = 0;
  double subTotalValue = 0.0;

  late ProgressDialog pr;


  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController countryControllerId = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  List<dynamic> CountriesList = [];
  List<dynamic> statelists = [];


  Future<void> getData() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
        username = prefs.getString('username')!;
        userid = prefs.getInt('email')!;
      });
    }catch(e){
      print(e);
    }
    String url1 = APIConstant.login;
    print(url1);
    Map<String, dynamic> body = {
      'MobileNo': '9160747554',
    };
    print("Profile get details api calling :" + body.toString());
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

    if (msg=='No Records Found') {

    } else {
      setState(() {

        nameController.text = data['objCustomers']['FirstName'] + " " + data['objCustomers']['LastName'];
        emailController.text = data['objCustomers']['Email'];
        mobileNumberController.text = data['objCustomers']['MobileNo'];
        cityController.text = data['objCustomers']['City'];
        //stateController.text = data['objCustomers']['State'];
        //countryController.text = data['objCustomers']['Country'];
        zipcodeController.text = data['objCustomers']['ZipCode'];
        addressController.text = data['objCustomers']['Address1'] ?? '';


      });
    }


    String url ="http://adslay.arjunweb.in/API/HomeAPI/CountriesList" ;
    print(url);
    var response1 =
    await get(Uri.parse(url), headers: {"Accept": "application/json"});
    setState(() {
      print(''+response1.body.toString());
      CountriesList = jsonDecode(response1.body)['CountriesList'];
      isLoading=false;
    });
  }


  Future<void> loadstates() async {
    String url1 = 'http://adslay.arjunweb.in/API/HomeAPI/StatesList';
    print(url1);
    Map<String, dynamic> body = {
      'CountryId': ''+countryControllerId.text.toString(),
    };
    print("Profile get details api calling :" + body.toString());
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
    setState(() {
      print(''+data.toString());
      statelists =data['StatesList'];
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
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
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
                      children: [
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Image.asset(
                                  "assets/images/userprofile.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                Text(
                                  ""+username,
                                  style: TextStyle(
                                    fontFamily: "Mont-SemiBold",
                                    fontSize: 17,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    "Unique ID: "+userid.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Mont-Regular',
                                      fontSize: 14,
                                      color: ConstantColors.appTheme,
                                    ),

                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Divider(
                            thickness: 5,
                            height: 10,
                            color: ConstantColors.lightGrey,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "BILLING ADDRESS",
                                      style: TextStyle(
                                        fontFamily: "Mont-SemiBold",
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                    child: TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintText: 'Enter Your Name',

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                    child: TextField(
                                      controller: addressController,
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintText: 'Enter Your Address',

                                      ),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:   [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
                                          child: CountriesList == null
                                              ? const SizedBox(height: 0, width: double.infinity)
                                              : Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                child: DropdownButton(
                                                  icon: const Icon(
                                                    Icons
                                                        .arrow_drop_down_circle_outlined,
                                                    size: 15,
                                                  ),
                                                  dropdownColor:
                                                  Colors.white,
                                                  isExpanded: true,
                                                  underline: SizedBox(),
                                                  hint: const Text(
                                                    'Select Country',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        "Lorin",
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                        fontSize: 14.0,
                                                        color: Color(
                                                            0xFF141E28)),
                                                  ),
                                                  value: countryController.text != '' ? countryController.text : null,
                                                  items: CountriesList
                                                      .map((item) {
                                                    return DropdownMenuItem(
                                                      child: Text(
                                                        item['CountryName'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFF000000)),
                                                      ),
                                                      value: item['CountryName']
                                                          .toString(),
                                                    );
                                                  }).toList(), onChanged: (Object? value) {
                                                  setState(() {
                                                    print('' + value!.toString());
                                                    countryController.text =
                                                        value.toString();
                                                    for(int i=0;i<CountriesList.length;i++){
                                                      if(countryController.text==CountriesList[i]['CountryName']){
                                                        countryControllerId.text=CountriesList[i]['CountryId'].toString();
                                                      }
                                                    }
                                                    loadstates();
                                                  });
                                                },

                                                ),
                                              ),
                                              const Divider(thickness: 1,height: 1,color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
                                          child: statelists == null ? const SizedBox(height: 0, width: double.infinity)
                                              : Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                child: DropdownButton(
                                                  icon: const Icon(
                                                    Icons
                                                        .arrow_drop_down_circle_outlined,
                                                    size: 15,
                                                  ),
                                                  dropdownColor:
                                                  Colors.white,
                                                  isExpanded: true,
                                                  underline: SizedBox(),
                                                  hint: const Text(
                                                    'Select State',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        "Lorin",
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                        fontSize: 14.0,
                                                        color: Color(
                                                            0xFF141E28)),
                                                  ),
                                                  value: stateController.text != '' ? stateController.text : null,
                                                  items: statelists
                                                      .map((item) {
                                                    return DropdownMenuItem(
                                                      child: Text(
                                                        item['StateName'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFF000000)),
                                                      ),
                                                      value: item['StateName']
                                                          .toString(),
                                                    );
                                                  }).toList(), onChanged: (Object? value) {
                                                  setState(() {
                                                    print('' + value!.toString());
                                                    stateController.text =
                                                        value.toString();
                                                    // for(int i=0;i<CountriesList.length;i++){
                                                    //   if(countryController.text==CountriesList[i]['CountryName']){
                                                    //     countryControllerId.text=CountriesList[i]['CountryId'].toString();
                                                    //   }
                                                    // }
                                                    // loadstates();
                                                  });
                                                },

                                                ),
                                              ),
                                              const Divider(thickness: 1,height: 1,color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:   [
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                                          child: TextField(
                                            controller: cityController,
                                            decoration: const InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Select City',

                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
                                          child: TextField(
                                            controller: zipcodeController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey),
                                              ),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintText: 'Enter Zip Code ',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Divider(
                                      thickness: 5,
                                      height: 10,
                                      color: ConstantColors.lightGrey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 15, 5, 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Subtotal: ",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: "Mont-Regular",
                                            color: ConstantColors.appTheme,
                                          ),

                                        ),
                                        Text(
                                          "\$"+widget.total.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Mont-Regular",
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
                                        fontFamily: "Mont-Light",
                                        color: Colors.black,
                                      ),

                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (nameController.text == '') {
                                            Fluttertoast.showToast(
                                                msg: "enter name",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          } else if (addressController.text == '') {
                                            Fluttertoast.showToast(
                                                msg: "enter address",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }else if (countryController.text == '') {
                                            Fluttertoast.showToast(
                                                msg: "Choose country",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }else if (stateController.text == '') {
                                            Fluttertoast.showToast(
                                                msg: "Choose state",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }else if (cityController.text == '') {
                                            Fluttertoast.showToast(
                                                msg: "Enter city",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }else if (zipcodeController.text == '') {
                                            Fluttertoast.showToast(
                                                msg: "Enter zipcode",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }else {
                                            getData11();
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
                                              "PROCEED TO PAY",
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
                              )
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> getData11() async {
    String url1 = 'http://adslay.arjunweb.in/API/OrderAPI/OrderInsertAPI';
    print('Upload billing details url: '+url1);
    Map<String, dynamic> body = {
      'MobileNo': '9160747554',//mobileNumber.toString(),
      'BillingAddress1': ''+addressController.text.toString(),
      'BillingAddress2': ''+zipcodeController.text.toString(),
      'BillingCity': ''+cityController.text.toString(),
      'BillingState': ''+stateController.text.toString(),
      'BillingCountry': ''+countryController.text.toString(),
    };
    print('Upload billing details body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print('Upload billing details response :' + response.body.toString());
    setState(() {
      String msg = jsonDecode(response.body)['msg'];
      if (msg == "Product Added to Your Cart" || msg == "success" ||  msg == "Success")
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ThankYouScreen()));
      }else{
        print("Unable to get API response.");
      }
    });
    setState(() {
      isLoading = false;
    });
  }

}
