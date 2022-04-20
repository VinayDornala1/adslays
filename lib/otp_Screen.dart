import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'API.dart';
import 'StoreDetails.dart';
import 'StoresScreen.dart';


class OTPScreen extends StatefulWidget {

  var mobileNumber;
  var countryCode;

  OTPScreen({Key? key, this.mobileNumber,this.countryCode}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {


  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Color(0xFF0063AD),
    borderRadius: BorderRadius.circular(12.0),
    border: Border.all(
      color: Color(0xFFFFFFFF),
    ),
  );

  late String genotp;
  // String signature;
  late String verificationId;
  String errorMessage = '';
  bool smsGateway = false;
  bool firebase = true;
  String smsGatewayUrl = '';
  String isOtp = '';
  late String deviceOS;

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
                                "assets/images/logo_white.png",
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
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0,bottom: 0),
                                child: Center(
                                  child: GradientText(
                                    'Verification Code',
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    colors: const [
                                      Colors.redAccent,
                                      Colors.deepOrangeAccent,
                                      Colors.orangeAccent,
                                    ],
                                  ),
                                ),

                              ),
                              const Padding(
                                padding: EdgeInsets.only(top:10.0,bottom: 10),
                                child: Text(
                                  "Enter the verification code we have \n just sent you",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:10.0,bottom: 10),
                                child: Image.asset("assets/images/otpicon.png",width: 50,height: 50,)
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Container(
                                    margin: const EdgeInsets.only(left: 30, right: 30),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child:  const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        //controller: mobilenumber,
                                        decoration: InputDecoration(
                                          hintText: "Enter mobile number",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  //IntrinsicHeight

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetails()));
                                    },
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      width: 180,
                                      decoration:  const BoxDecoration(
                                          gradient:  LinearGradient(
                                            colors: [
                                              Colors.orange,
                                              Colors.deepOrangeAccent,
                                            ],
                                          )
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Text(
                                        "VERIFY OTP",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
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
                                  "We have sent a 4 digit OTP to",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "" + widget.countryCode + " " + widget.mobileNumber,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),

                            ]
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:   [
                              const Center(
                                child: Text(
                                  "Didn't received a code?",
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

                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 15.0,right: 15,top: 5,bottom: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: GradientText(
                                        'RESEND',
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


  Widget pinputwidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      // child: PinPut(
      //   fieldsCount: 6,
      //   withCursor: true,
      //   textStyle: const TextStyle(fontSize: 25.0, color: Color(0xFFFFFFFF)),
      //   eachFieldWidth: 40.0,
      //   eachFieldHeight: 51.0,
      //   onSubmit: (String pin) => verifyOTP(pin),
      //   controller: _pinPutController,
      //   focusNode: _pinPutFocusNode,
      //   submittedFieldDecoration: pinPutDecoration,
      //   selectedFieldDecoration: pinPutDecoration,
      //   followingFieldDecoration: pinPutDecoration,
      //   pinAnimationType: PinAnimationType.fade,
      // ),
    );
  }

  late ProgressDialog pr;

  void verifyOTP(String pin) async {
    // if(widget.dropdownvalue == '+91'){
    //   if(genotp==pin){
    //     await pr.show();
    //     String url = APIConstant.base_url + "StudentsAPI/MobileAvailability?MobileNo="+widget.dropdownvalue+widget.mobilenumber;
    //     url = url.replaceAll('+', '');
    //     print(''+url);
    //     Response response=await get(Uri.parse(url));
    //     Map data = jsonDecode(response.body);
    //     print(data);
    //     print(url);
    //     bool msg = data['data'];
    //     print(msg);
    //     await pr.hide();
    //     if (msg) {
    //     } else {
    //       var username = data['Name'];
    //       var email = data['Email'];
    //       var userid = data['StudentUniqueid'];
    //       var mobileNo = data['MobileNo'];
    //       var studetImageUrl = data['StudetImageUrl'];
    //       var studentId = data['StudentId'];
    //       var alumniId = data['AlumniId'];
    //       var alumniName = data['AlumniName'];
    //       var alumniDesignation = data['Designation'];
    //       var loginAs = data['Loginas'];
    //
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       prefs.setString('userid', userid);
    //       prefs.setString('username', username);
    //       prefs.setString('email', email);
    //       prefs.setString('mobilenumber', mobileNo);
    //       prefs.setString('studetImageUrl', studetImageUrl);
    //       prefs.setInt('studentId', studentId);
    //       prefs.setInt('alumniId', alumniId);
    //       prefs.setString('alumniName', alumniName);
    //       prefs.setString('alumniDesignation', alumniDesignation);
    //       prefs.setString('loginAs', loginAs);
    //
    //       print(userid.toString());
    //       print(studentId.toString());
    //       // Navigator.push(
    //       //     context,
    //       //     MaterialPageRoute(
    //       //         builder: (context) => Onboarding(sname:username)));
    //     }
    //   }
    //   else{
    //     Fluttertoast.showToast(
    //         msg: "Invalid OTP",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0
    //     );
    //   }
    // }else{
    //   //verifyOtpsads(pin);
    // }
  }

}

