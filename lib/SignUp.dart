import 'package:adslay/otp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();


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
                                    'WELCOME',
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
                                padding: EdgeInsets.only(top:10.0,bottom: 10),
                                child: Text(
                                  "Please sign up to get started",
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
                                    margin: const EdgeInsets.only(left: 25, right: 25),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                            child: TextField(
                                              inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),],
                                              keyboardType: TextInputType.streetAddress,
                                              controller: fullNameController,
                                              decoration: const InputDecoration(
                                                hintText: "Full Name",
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                            flex: 1,
                                            child:
                                            Image.asset(
                                              "assets/images/user.png",
                                              height: 22,
                                              width: 22,)
                                        )
                                      ],
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Container(
                                    margin: const EdgeInsets.only(left: 25, right: 25),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                            child: TextField(
                                              inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[0-9]")),],
                                              keyboardType: TextInputType.phone,
                                              controller: mobileNumberController,
                                              decoration: const InputDecoration(
                                                hintText: "Mobile Number",
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                            flex: 1,
                                            child:
                                            Image.asset(
                                              "assets/images/mobilenumber.png",
                                              height: 22,
                                              width: 22,)
                                        )
                                      ],
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Container(
                                    margin: const EdgeInsets.only(left: 25, right: 25),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                            child: TextField(
                                              inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),],
                                              keyboardType: TextInputType.emailAddress,
                                              controller: emailController,
                                              decoration: const InputDecoration(
                                                hintText: "Email Address",
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                            flex: 1,
                                            child:
                                            Image.asset(
                                              "assets/images/mail.png",
                                              height: 22,
                                              width: 22,)
                                        )
                                      ],
                                    )
                                ),
                              ),

                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(80.0, 25.0, 80.0, 0),
                                child:
                                MaterialButton(
                                  onPressed: () { },
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
                                      "SUBMIT",
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
                                  "Already have an account?",
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPScreen(mobileNumber: '9999999999',countryCode: '+91',)));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 15.0,right: 15,top: 5,bottom: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: GradientText(
                                        'LOGIN',
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
