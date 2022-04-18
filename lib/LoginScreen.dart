import 'dart:convert';

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
    return Scaffold(
        body: Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height ,
                child: Image.asset("assets/images/login_bg.png",fit: BoxFit.fill,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0,top: 80),
                    child: Center(child: Image.asset("assets/images/logo_white.png",fit: BoxFit.fill,height: MediaQuery.of(context).size.height * 0.12,width: MediaQuery.of(context).size.width * 0.60)),
                  ),

                  SizedBox(
                    //height: 400,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0,bottom: 0),
                            child: Center(
                              child: GradientText(
                                'HELLO',
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                colors: const [
                                  Color(0xff493fba),
                                  Color(0xff456bd8),
                                  Color(0xff40a2fd),
                                ],
                              ),
                            ),

                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:10.0),
                            child: Text(
                              "Please enter the details to Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
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
                            padding:
                            const EdgeInsets.fromLTRB(80.0, 25.0, 80.0, 0),
                            child: MaterialButton(
                                minWidth: double.infinity,
                                height: 56,
                                elevation: 0,
                                splashColor: const Color(0xFFFF9F24),
                                child: const Text(
                                  'GET OTP',
                                  style: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "Lorin"),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                color: const Color(0xFFFF9F24),
                                onPressed: () {
                                  getDataFromAPI();
                                  //   Navigator.push(context, PageTransition(type: PageTransitionType.scale, child: OtpScreen()));
                                }),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:10.0),
                            child: Text(
                              "An OTP will be sent to this number",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:   [
                      Center(
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
                          child: Container(
                            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 5,bottom: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GradientText(
                              'SIGN UP',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                              colors:[
                                Color(0xff493fba),
                                Color(0xff456bd8),
                                Color(0xff40a2fd),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]
        )
    );
  }
}
