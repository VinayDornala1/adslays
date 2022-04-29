//
// import 'dart:convert';
//
// import 'package:another_flushbar/flushbar.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:http/http.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Constants/API.dart';
//
//
//
// class TermsAndConditions extends StatefulWidget {
//
//   var screenName;
//
//   TermsAndConditions({this.screenName});
//
//   @override
//   _TermsAndConditionsState createState() => _TermsAndConditionsState();
// }
//
// class _TermsAndConditionsState extends State<TermsAndConditions> {
//   final TextEditingController screenTitle = TextEditingController();
//   final TextEditingController description = TextEditingController();
//
//
//   bool isLoading = true;
//
//   String name;
//   String gender;
//   String mobileNumber;
//   String email;
//   String userid;
//   String username;
//   int studentId;
//
//
//   Future<void> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       email = prefs.getString('email');
//       mobileNumber = prefs.getString('mobilenumber');
//       userid = prefs.getString('userid');
//       username = prefs.getString('username');
//
//     });
//
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       String url = APIConstant.getTermsData + widget.screenName;
//       print("Get " + widget.screenName + " url is: " + url);
//       var response11 = await get(Uri.parse(url));
//       setState(() {
//         description.text = jsonDecode(response11.body)['Description'];
//       });
//       setState(() {
//         isLoading = false;
//       });
//
//     } else {
//       _showErrorSnackBar("Check internet connection..!");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFAFAFA),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(27.0, 40.0, 0, 0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child:
//                   Stack(children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Color(0xFF000000).withOpacity(1.0),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 5,
//                               color: Color(0xFF000000).withOpacity(0.1),
//                               spreadRadius: 0)
//                         ],
//                       ),
//                       child: CircleAvatar(
//                         backgroundColor: Color(0xFFFFFFFF),
//                         radius: 18,
//                         child: SvgPicture.asset(
//                           'assets/images/back.svg',
//                           color: Color(0xFF00387D),
//                           height: 13,
//                           width: 16,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(50.0, 5, 20, 0),
//                       child: Center(
//                         child: Text(
//                           ''+widget.screenName,
//                           maxLines: 3,
//                           style: TextStyle(
//                               fontFamily: 'Lorin',
//                               color: Color(0xFF0063AD),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w800),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(24, 19.26, 24.0, 0),
//                 child: Html(
//                   data: '' + description.text,
//                   defaultTextStyle: TextStyle(
//                       height: 1.5,
//                       fontFamily: 'Lorin',
//                       color: Color(0xFF141E28).withOpacity(0.5),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showErrorSnackBar(String message) {
//     Flushbar(
//       title: 'Hey $username',
//       flushbarPosition: FlushbarPosition.TOP,
//       backgroundColor: Colors.red,
//       message: message,
//       duration: Duration(seconds: 2),
//     ).show(context);
//   }
// }
//
//
