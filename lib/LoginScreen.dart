import 'dart:convert';

import 'package:adslay/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'API.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _dropDownValue="+91";
  String countryname="India";
  late List<dynamic> CountryList;
  final phoneNumber = TextEditingController();
  late ProgressDialog pr;
  // String onesignalPlayerID;

  @override
  void initState() {
    super.initState();
    getData();
    Future.delayed(Duration.zero, () {
      // initOneSignal();
    });
  }

  Future<String>  getData() async {

    var countriesRes = await get(
        Uri.parse(APIConstant.base_url + 'StudentsAPI/GetCountryCodes'),
        headers: {"Accept": "application/json"});
    setState(() {
      CountryList = jsonDecode(countriesRes.body)['lstCodes'];
    });

    var response = await get(
        Uri.parse(APIConstant.base_url + 'StudentsAPI/GetCountryCodes'),
        headers: {"Accept": "application/json"});
    setState(() {
      CountryList = jsonDecode(response.body)['lstCodes'];
    });
    return "Success";
  }

  // Future<void> initOneSignal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) async {
  //     var status = await OneSignal.shared.getPermissionSubscriptionState();
  //     if (status.subscriptionStatus.subscribed) {
  //       String onesignalUserId = status.subscriptionStatus.userId;
  //       print('Login Player ID: ' + onesignalUserId);
  //       // print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
  //     }});
  //   OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
  //     // print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
  //   });
  //   OneSignal.shared.setEmailSubscriptionObserver(
  //           (OSEmailSubscriptionStateChanges changes) {
  //         // print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
  //       });
  //   OneSignal.shared
  //       .setInFocusDisplayType(OSNotificationDisplayType.notification);
  //   OneSignal.shared
  //       .promptUserForPushNotificationPermission(fallbackToSettings: true);
  //   final app_id = "b6c5895c-94ea-42c2-a015-5b97110b39fe";
  //   OneSignal.shared.init(app_id, iOSSettings: {
  //     OSiOSSettings.autoPrompt: false,
  //     OSiOSSettings.inAppLaunchUrl: true
  //   });
  //
  //   try {
  //     var deviceState = await OneSignal.shared.getPermissionSubscriptionState();
  //     var playerId = deviceState.subscriptionStatus.userId;
  //
  //     setState(() {
  //       onesignalPlayerID = playerId;
  //     });
  //     print('Player ID: ' + playerId);
  //     print('-------------' + playerId);
  //   }catch (error) {
  //
  //   }
  // }

  void getDataFromAPI() async {
    await pr.show();
    String url = APIConstant.base_url + "StudentsAPI/MobileAvailability?MobileNo="+phoneNumber.text;
    url = url.replaceAll('+', '');
    print('Login url is: '+url);
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    print(data);
    bool msg = data['data'];
    await pr.hide();
    print("Login mobile number api response is: " + msg.toString());
    if (msg) {
      Fluttertoast.showToast(
          msg: "Records not found please register",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {

      // Navigate to OTP screen
    }
  }
  final mobilenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height ,
                    child: Image.asset("assets/images/login_bg.png",fit: BoxFit.fill,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Center(
                              child:
                              Image.asset(
                                "assets/images/logo.jpg",
                                fit: BoxFit.fill,
                              )
                          )
                      ),
                      SizedBox(
                        width: double.infinity,
                        //height: MediaQuery.of(context).size.height * 0.50,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 30.0,bottom: 0),
                                child: Center(
                                  child: Text(
                                    'HELLO',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                              ),
                              const Padding(
                                padding: EdgeInsets.only(top:5.0,bottom: 10),
                                child: Text(
                                  "Please enter the details to Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Container(
                                    margin: const EdgeInsets.only(left: 30, right: 30),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.3),
                                      // border: Border.all(
                                      //   width: 1,
                                      // ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        controller: mobilenumber,
                                        decoration: const InputDecoration(
                                          hintText: "Enter mobile number",
                                          border: InputBorder.none,

                                        ),
                                      ),
                                    )
                                  //IntrinsicHeight

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                    },
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      width: 180,
                                      decoration:  const BoxDecoration(
                                          gradient:  LinearGradient(
                                            colors: [
                                              Color(0xff3962cb),
                                              Color(0xff3962cb),
                                            ],
                                          )
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Text(
                                        "GET OTP",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Lorin"
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(top:10.0),
                                child: Text(
                                  "An OTP will be sent to this number",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),

                            ]
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:   [
                              const Center(
                                child: Text(
                                  "New to Adslay?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,bottom: 50),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 15.0,right: 15,top: 8,bottom: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: GradientText(
                                        ' SIGN UP ',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        colors:const [
                                          Colors.lightGreen,
                                          Colors.orangeAccent,
                                          Colors.yellowAccent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ]
            ),
          )
      ),
    );
  }
}
