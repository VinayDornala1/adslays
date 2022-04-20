// import 'dart:convert';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:stormoverseas/Constants/API.dart';
// import 'package:stormoverseas/Providers/bool_provider.dart';
// import 'package:stormoverseas/TermsAndConditions.dart';
// import 'package:stormoverseas/bottom_bar.dart';
// import 'package:stormoverseas/home_screen11.dart';
// import 'package:stormoverseas/models/tab_list.dart';
// import 'package:stormoverseas/screens/alumni/alumni.dart';
// import 'package:stormoverseas/screens/alumni/alumnia_dashboard_overview.dart';
// import 'package:stormoverseas/screens/application/application_process.dart';
// import 'package:stormoverseas/screens/application/conform_yourdetails.dart';
// import 'package:stormoverseas/screens/application/wish_list.dart';
// import 'package:stormoverseas/screens/applyhere/conform_yourdocuments.dart';
// import 'package:stormoverseas/screens/counseling/counseling_backup.dart';
// import 'package:stormoverseas/screens/counseling/counsiling_screen.dart';
// import 'package:stormoverseas/screens/counseling/video_counselling.dart';
// import 'package:stormoverseas/screens/course_overview.dart';
// import 'package:stormoverseas/screens/course_selection.dart';
// import 'package:stormoverseas/screens/courses_selectionstudy2.dart';
// import 'package:stormoverseas/screens/discussion/discussion_backup.dart';
// import 'package:stormoverseas/screens/discussion/discussion_forum.dart';
// import 'package:stormoverseas/screens/discussion/discussion_screen.dart';
// import 'package:stormoverseas/screens/feature_trending_details.dart';
// import 'package:stormoverseas/screens/profile/dummy_profiler.dart';
// import 'package:stormoverseas/screens/profile/edit_details.dart';
// import 'package:stormoverseas/screens/profile/profile_screen.dart';
// import 'package:stormoverseas/screens/quiz/my_app_backup.dart';
// import 'package:stormoverseas/screens/quiz/my_app_screen.dart';
// import 'package:stormoverseas/screens/search_course.dart';
// import 'package:stormoverseas/screens/topuniversity_overview.dart';
// import 'package:stormoverseas/screens/training/gre_training.dart';
// import 'package:stormoverseas/screens/training/ielts_overview.dart';
// import 'package:stormoverseas/screens/training/online_ielts.dart';
// import 'package:stormoverseas/screens/training/pte_training.dart';
// import 'package:stormoverseas/screens/training/training_backup.dart';
// import 'package:stormoverseas/screens/training/training_screen.dart';
// import 'package:stormoverseas/screens/training/under_construction.dart';
// import 'package:stormoverseas/screens/university_selection.dart';
// import 'package:stormoverseas/screens/video_player.dart';
// import 'package:stormoverseas/screens/webinar/events_overview.dart';
// import 'package:stormoverseas/screens/webinar/previous_webinar.dart';
// import 'package:stormoverseas/screens/webinar/upcoming_webinar.dart';
// import 'package:stormoverseas/screens/webinar/webinar_page.dart';
// import 'package:stormoverseas/screens/webinar/webinar_screen_backup.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'most_popular_screen.dart';
// import 'notification_screen.dart';
// import 'dart:io' show Platform;
// import 'dart:ui';
//
// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   List<TabList> _tabListalumni,tabListStudent = [];
//
//   BoolProvider _boolProvider = BoolProvider();
//   int _currentIndex = 0;
//   String Email='';
//   String MobileNo='';
//   List<dynamic> MobileBannersList;
//   bool isLoading = true;
//   String deviceOS;
//   double screenWidth;
//
//   _onSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//
//
//   String name;
//   String gender;
//   String mobileNumber;
//   String email;
//   String dateOfBirth;
//   String location;
//   int _current = 0;
//
//   String userid;
//   String username;
//
//   int studentId;
//   int alumniId;
//
//   String alumniName;
//   String loginAs;
//   bool isAlumni = false;
//
//   String secondName;
//   String alumniEmail;
//   String alumniDesignation;
//   String alumniMobilePhone;
//   String alumniPassOutYear;
//   String alumniCompany;
//   String alumniRating;
//   String alumniProfilePicUrl;
//   String alumniUniversity;
//   String alumniLocation;
//   String alumniOverView;
//   String studentInteractions;
//   String countryId;
//   String alumniCountryName;
//   String alumniSubjectId;
//   String alumniSubjectName;
//
//
//   Future<void> getdata() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       mobileNumber = prefs.getString('mobilenumber');
//       userid = prefs.getString('userid');
//       username = prefs.getString('username');
//       email = prefs.getString('email');
//       studentId = prefs.getInt('studentId');
//       alumniId = prefs.getInt('alumniId');
//       alumniName = prefs.getString('alumniName');
//       loginAs = prefs.getString('loginAs');
//       if (loginAs == "Alumni")
//       {
//         isAlumni = true;
//       }
//     });
//     String url = APIConstant.homebanner;
//     print('Get home banners url is: '+url);
//     var response11 = await get(Uri.parse(url));
//     setState(() {
//       MobileBannersList = jsonDecode(response11.body)['MobileBannersList'];
//       // print(''+MobileBannersList.toString());
//     });
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     // _boolProvider = Provider.of<BoolProvider>(context, listen: false);
//
//     if (Platform.isAndroid) {
//       // Android-specific code
//       deviceOS = "Android";
//     } else if (Platform.isIOS) {
//       // iOS-specific code
//       deviceOS = "IOS";
//     }
//     var physicalScreenSize = window.physicalSize;
//     var physicalWidth = physicalScreenSize.width;
//     var physicalHeight = physicalScreenSize.height;
//     //screenWidth = MediaQuery.of(context).size.width;
//     print("Device screen screen size is:" + physicalScreenSize.toString());
//     print("Device screen width is:" + physicalWidth.toString());
//     print("Device screen height is:" + physicalHeight.toString());
//     screenWidth = physicalWidth;
//     getdata();
//
//     _tabListalumni = [
//       TabList(
//           title: "Most Popular",
//           image: "assets/icons/Star.svg",
//           isSelect: false),
//       TabList(
//           title: "Training",
//           image: "assets/icons/training.svg",
//           isSelect: false),
//       TabList(
//           title: "Counseling",
//           image: "assets/icons/counseling.svg",
//           isSelect: false),
//       TabList(
//           title: "Webinar",
//           image: "assets/icons/counseling.svg",
//           isSelect: false),
//       TabList(
//           title: "Discussion",
//           image: "assets/icons/discussion.svg",
//           isSelect: false),
//
//       // TabList(
//       //     title: "Play Quiz",
//       //     image: "assets/icons/discussion.svg",
//       //     isSelect: false),
//     ];
//     tabListStudent = [
//       TabList(
//           title: "Most Popular",
//           image: "assets/icons/Star.svg",
//           isSelect: false),
//       TabList(
//           title: "Alumni",
//           image: "assets/icons/alumni.svg",
//           isSelect: false),
//       TabList(
//           title: "Training",
//           image: "assets/icons/training.svg",
//           isSelect: false),
//       TabList(
//           title: "Counseling",
//           image: "assets/icons/counseling.svg",
//           isSelect: false),
//       TabList(
//           title: "Webinar",
//           image: "assets/icons/counseling.svg",
//           isSelect: false),
//       TabList(
//           title: "Discussion",
//           image: "assets/icons/discussion.svg",
//           isSelect: false),
//       // TabList(
//       //     title: "Play Quiz",
//       //     image: "assets/icons/discussion.svg",
//       //     isSelect: false),
//     ];
//     getLocation();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     _boolProvider  =  Provider.of<BoolProvider>(context,);
//     bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
//     bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: _drawer(),
//       onDrawerChanged: (isOpen) {
//         if (isOpen == true) {
//           Provider.of<BoolProvider>(context , listen : false).setNoBookmarks(isOpen);
//
//         } else if (isOpen == false) {
//           Provider.of<BoolProvider>(context , listen : false).setNoBookmarks(isOpen);
//
//         }
//       },
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 33,
//             ),
//             _appBar(),
//             _createOwnFuture(),
//             _subHeadingWidget(),
//             isAlumni?SizedBox(width: 0,height: 0,):_searchWidget(),
//             _imageSlider(),
//             _tabs(),
//             isAlumni?_tabBodyalumni():_tabBodystudent(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _drawer() {
//     return Container(
//       width: 100,
//
//       child: Drawer(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15, bottom: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(
//                       false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   _boolProvider.setBottomChange(3);
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) =>TabbarProfile()));
//
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/sideprofile.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Profile',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   _boolProvider.setBottomChange(2);
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) =>ApplicationProcess()));
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/Application.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Application',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) =>VideoCounselling()));
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/sidecounseling.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Counselling ',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   isAlumni?Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => AluminaDashboardOverview()))
//                       :_currentIndex = 1;// Alumni
//                   // _currentIndex = 4;// Discussions
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) =>DiscussionForum()));
//
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/sidediss.svg'),
//                     //SvgPicture.asset('assets/icons/alumni.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     isAlumni?Text(
//                       'Dashboard',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ):Text(
//                       'Alumni',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   _currentIndex = 2;
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) =>Counseling()));
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/sidetraining.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Training',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) =>UpcomingWebinar()));
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/sideevents.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Events',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Provider.of<BoolProvider>(context, listen: false).setNoBookmarks(false);
//                   _scaffoldKey.currentState.openEndDrawer();
//                   Share.share(
//                       'Download Storm Overseas Education app from store  https://stormoverseas.com/app',
//                       subject: 'Storm Overseas Education');
//                 },
//                 child: Column(
//                   children: [
//                     SvgPicture.asset('assets/icons/sideshare.svg'),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       'Share App',
//                       style: TextStyle(
//                         color: Color(0xFF141E28),
//                         fontFamily: "Lorin",
//                         fontSize: 10,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _appBar() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             child: SvgPicture.asset(
//               'assets/icons/menu.svg',
//               height: 24,
//               width: 24,
//             ),
//             onTap: () {
//               _scaffoldKey.currentState.openDrawer();
//             },
//           ),
//           GestureDetector(
//             child: SvgPicture.asset(
//               'assets/icons/notification.svg',
//               height: 40,
//               width: 40,
//             ),
//             onTap: () {
//
//               Provider.of<BoolProvider>(context , listen : false).setNoBookmarks(true);
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen())).then((value){
//                 Provider.of<BoolProvider>(context , listen : false).setNoBookmarks(false);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _createOwnFuture() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
//       child: Text(
//         isAlumni?'You are\nmeant to be a MENTOR':'Create your own future',
//         style: TextStyle(
//             color: Color(0xFF0063AD).withOpacity(1.0),
//             fontSize: 24,
//             fontStyle: FontStyle.normal,
//             letterSpacing: 0.5,
//             wordSpacing: 2,
//             fontWeight: FontWeight.w800,
//             fontFamily: "Lorin"),
//       ),
//     );
//   }
//
//   Widget _subHeadingWidget() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(24, 5, 0, 0),
//       child: Text(
//         isAlumni?'Let your experience guide the younger \ngeneration of students.':'Search or get a shortlist of courses suitable\nfor you and start applying',
//         style: TextStyle(
//             color: Color(0xFF141E28),
//             fontSize: 12,
//             letterSpacing: 0.5,
//             fontStyle: FontStyle.normal,
//             fontWeight: FontWeight.w400,
//             fontFamily: "Lorin"),
//       ),
//     );
//   }
//
//   Widget _searchWidget() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(24, 19, 24, 0),
//       child: GestureDetector(
//         onTap: () {
//           _boolProvider.setBottomChange(1);
//         },
//         child: Container(
//           height: 50,
//           decoration: BoxDecoration(
//               color: Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(13.0),
//               border: Border.all(color: Color(0xFFF2F2F2), width: 1)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 'Search Course / University',
//                 style: TextStyle(
//                     color: Color(0xFFAAAAAA),
//                     fontFamily: 'lorin',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               SvgPicture.asset('assets/icons/Search.svg')
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _imageSlider() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
//       child:
//
//       // Container(
//       //   child: SizedBox(
//       //     //X:1125,Pro: 1170,Pro Max: 1284
//       //       height: deviceOS == "IOS"?screenWidth>1200.0?180:160:160,
//       //       width: double.infinity,
//       //       child: isLoading
//       //           ?Shimmer.fromColors(
//       //         baseColor: Colors.grey[500],
//       //         highlightColor: Colors.grey[300],
//       //         enabled: true,
//       //         child: Container(
//       //           child: Padding(
//       //             padding: const EdgeInsets.all(8.0),
//       //             child: Container(
//       //               decoration: BoxDecoration(
//       //                 borderRadius: BorderRadius.circular(20.0),
//       //               ),
//       //               //  height: 180,
//       //               width: double.infinity,
//       //             ),
//       //           ),
//       //         ),
//       //       )
//       //           :Carousel(
//       //         images: [
//       //           for(int i=0;i<MobileBannersList.length;i++)
//       //             Padding(
//       //               padding: const EdgeInsets.all(8.0),
//       //               child: GestureDetector(
//       //                 onTap: (){
//       //                   print('Mobile banner click redirection screen title is: '+MobileBannersList[i]['ActionToBeOpen']);
//       //                   if (MobileBannersList[i]['ActionToBeOpen']=='Home') {
//       //                     _boolProvider.setBottomChange(0);
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='Profile') {
//       //                     _boolProvider.setBottomChange(3);
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='Application') {
//       //                     _boolProvider.setBottomChange(2);
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='Coursesearch') {
//       //                     _boolProvider.setBottomChange(1);
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='Upcoming' || MobileBannersList[i]['ActionToBeOpen']=='Upcoming Webinar') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => UpcomingWebinar()));
//       //
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='Previous') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => PreviousWebinars()));
//       //
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='WebinarsWebview') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => EventsOverview(WebinarId:MobileBannersList[i]['ActionValue'])));
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='CourseOverview') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => CourseOverview(UniversityCourseId:MobileBannersList[i]['ActionValue'])));
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='UniversityOverview') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => TopUniversityOverview(UniversityId:MobileBannersList[i]['ActionValue'])));
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='UniversityList'){
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => Universitieselection(
//       //                               CountryId: MobileBannersList[i]['ActionValue'],
//       //                               StudyLevelId:  MobileBannersList[i]['ActionValue'],
//       //                               studytype:  MobileBannersList[i]['ActionValue'],
//       //                               searchtext:  '',
//       //                             ))).then((value) {
//       //
//       //                     });
//       //
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='CourseList') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => CourseSelection(
//       //                               CountryId: MobileBannersList[i]['ActionValue'],
//       //                               StudyLevelId: MobileBannersList[i]['ActionValue'],
//       //                               studytype: MobileBannersList[i]['ActionValue'],
//       //                               searchtext:  '',
//       //                             ))).then((value) {
//       //                     });
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='StudyArea') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => CourseSelection2(
//       //                                 subjectId: MobileBannersList[i]['ActionValue'],
//       //                                 studytype: MobileBannersList[i]['ActionValue'])));
//       //
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='Request Shortlisting') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => RequestShortlist()));
//       //
//       //                   }else if (MobileBannersList[i]['ActionToBeOpen']=='OnlineCounselling') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => VideoCounselling()));
//       //
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='IELTSTraining') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => OnlineIelts()));
//       //                   } else if (MobileBannersList[i]['ActionToBeOpen']=='PTETraining') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => PteTraning()));
//       //                   }else if (MobileBannersList[i]['ActionToBeOpen']=='GRETraining') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => GreTraining()));
//       //                   }else if (MobileBannersList[i]['ActionToBeOpen']=='TestPrepare') {
//       //                     Navigator.push(
//       //                         context,
//       //                         MaterialPageRoute(
//       //                             builder: (context) => UnderConstruction(title: "Test Prepare")));
//       //                   }
//       //
//       //
//       //                 },
//       //                 child: Container(
//       //                   decoration: BoxDecoration(
//       //                     image: DecorationImage(
//       //                       image: MobileBannersList[i]['BannerUrl'] == ''
//       //                           ? SizedBox()
//       //                           : NetworkImage(
//       //                           MobileBannersList[i]['BannerUrl'].toString()),
//       //                       fit: BoxFit.fill,
//       //                     ),
//       //                     borderRadius: BorderRadius.circular(20.0),
//       //                   ),
//       //                   //  height: 180,
//       //                   width: double.infinity,
//       //                 ),
//       //               ),
//       //             ),
//       //         ],
//       //         dotBgColor: Colors.transparent,
//       //         dotColor: Color(0xFFFFFF9F24),
//       //         dotSize: MobileBannersList.length.toDouble(),
//       //         dotPosition: DotPosition.bottomRight,
//       //         dotSpacing: 10,
//       //         autoplay: true,
//       //
//       //
//       //       )
//       //   ),
//       // ),
//       Container(
//         child: Stack(
//           children: [
//
//             SizedBox(
//               //X:1125,Pro: 1170,Pro Max: 1284
//                 height: deviceOS == "IOS"?screenWidth>1200.0?180:160:160,
//                 width: double.infinity,
//                 child: isLoading
//                     ?Shimmer.fromColors(
//                   baseColor: Colors.grey[500],
//                   highlightColor: Colors.grey[300],
//                   enabled: true,
//                   child: Container(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         //  height: 180,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                 ): CarouselSlider(
//                   items: [
//                     for(int i=0;i<MobileBannersList.length;i++)
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: (){
//                             print('Mobile banner click redirection screen title is: '+MobileBannersList[i]['ActionToBeOpen']);
//                             if (MobileBannersList[i]['ActionToBeOpen']=='Home') {
//                               _boolProvider.setBottomChange(0);
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='Profile') {
//                               _boolProvider.setBottomChange(3);
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='Application') {
//                               _boolProvider.setBottomChange(2);
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='Coursesearch') {
//                               _boolProvider.setBottomChange(1);
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='Upcoming' || MobileBannersList[i]['ActionToBeOpen']=='Upcoming Webinar') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => UpcomingWebinar()));
//
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='Previous') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => PreviousWebinars()));
//
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='WebinarsWebview') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => EventsOverview(WebinarId:MobileBannersList[i]['ActionValue'])));
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='CourseOverview') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CourseOverview(UniversityCourseId:MobileBannersList[i]['ActionValue'])));
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='UniversityOverview') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => TopUniversityOverview(UniversityId:MobileBannersList[i]['ActionValue'])));
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='UniversityList'){
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Universitieselection(
//                                         CountryId: MobileBannersList[i]['ActionValue'],
//                                         StudyLevelId:  MobileBannersList[i]['ActionValue'],
//                                         studytype:  MobileBannersList[i]['ActionValue'],
//                                         searchtext:  '',
//                                       ))).then((value) {
//
//                               });
//
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='CourseList') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CourseSelection(
//                                         CountryId: MobileBannersList[i]['ActionValue'],
//                                         StudyLevelId: MobileBannersList[i]['ActionValue'],
//                                         studytype: MobileBannersList[i]['ActionValue'],
//                                         searchtext:  '',
//                                       ))).then((value) {
//                               });
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='StudyArea') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CourseSelection2(
//                                           subjectId: MobileBannersList[i]['ActionValue'],
//                                           studytype: MobileBannersList[i]['ActionValue'])));
//
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='Request Shortlisting') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => RequestShortlist()));
//
//                             }else if (MobileBannersList[i]['ActionToBeOpen']=='OnlineCounselling') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => VideoCounselling()));
//
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='IELTSTraining') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => OnlineIelts()));
//                             } else if (MobileBannersList[i]['ActionToBeOpen']=='PTETraining') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => PteTraning()));
//                             }else if (MobileBannersList[i]['ActionToBeOpen']=='GRETraining') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => GreTraining()));
//                             }else if (MobileBannersList[i]['ActionToBeOpen']=='TestPrepare') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => UnderConstruction(title: "Test Prepare")));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='LiveChat') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Counseling(fromScreen: "LiveChat")));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='MyDocuments') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ConformYourDocuments()));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='VideoCounselling') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => VideoCounselling()));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='Wishlist') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => WishList()));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='CompleteProfile') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => EditDetails()));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='RequestNewShortlist') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => RequestShortlist()));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='ApplicationStatus') {
//                               _boolProvider.setBottomChange(2);
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='AlumniTerms') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => TermsAndConditions(screenName: "Alumni Terms And Conditions - APP",)));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='AlumniTerms') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => TermsAndConditions(screenName: "Alumni Terms And Conditions - APP",)));
//                             }
//
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='VideoCapsule')
//                             {
//                               Provider.of<BoolProvider>(context, listen: false)
//                                   .setNoBookmarks(true);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           YouTubePlayerScreen(videourl: MobileBannersList[i]['ActionValue'])))
//                                   .then((value) {
//                                 Provider.of<BoolProvider>(context, listen: false)
//                                     .setNoBookmarks(false);
//                               });
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='TextCapsule')
//                             {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           FeatureandTrendingDetails(
//                                               homedisplayid: MobileBannersList[i]['ActionValue'])));
//                             }
//                             else if (MobileBannersList[i]['ActionToBeOpen']=='VideoCounselling') {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => VideoCounselling()));
//                             }
//
//
//
//
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: MobileBannersList[i]['BannerUrl'] == ''
//                                     ? SizedBox()
//                                     : NetworkImage(
//                                     MobileBannersList[i]['BannerUrl'].toString()),
//                                 fit: BoxFit.fill,
//                               ),
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             //  height: 180,
//                             width: double.infinity,
//                           ),
//                         ),
//                       ),
//                   ],
//                   options: CarouselOptions(
//                       height: 400,
//                       viewportFraction: 1.0,
//                       initialPage: 0,
//                       reverse: false,
//                       autoPlay: true,
//                       aspectRatio: 5.0,
//                       autoPlayInterval: Duration(seconds: 3),
//                       autoPlayAnimationDuration: Duration(milliseconds: 800),
//                       enlargeCenterPage: false,
//                       scrollDirection: Axis.horizontal,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           _current = index;
//                         });
//                       }),
//                 )),
//
//             Positioned(
//               right: 20,
//               bottom:12,
//               child: isLoading
//                   ?Shimmer.fromColors(
//                 baseColor: Colors.grey[500],
//                 highlightColor: Colors.grey[300],
//                 enabled: true,
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       //  height: 180,
//                       // width: double.infinity,
//                     ),
//                   ),
//                 ),
//               ):Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: MobileBannersList.asMap().entries.map((entry) {
//                   return _current == entry.key
//                       ? GestureDetector(
//                     child: Container(
//                       width: 8.0,
//                       height: 8.0,
//                       margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white),
//                     ),
//                   ):GestureDetector(
//                     child: Container(
//                       width: 4.0,
//                       height: 4.0,
//                       margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.amber),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _tabs() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: Container(
//         height: 40,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: isAlumni?_tabListalumni.length:tabListStudent.length,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 _onSelected(index);
//               },
//               child: Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                           color: _currentIndex != null && _currentIndex == index
//                               ? Color(0xFF0063ad)
//                               : Color(0xFFF2F2F2),
//                           width: 1)),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
//                     child: Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CircleAvatar(
//                             backgroundColor:
//                             _currentIndex != null && _currentIndex == index
//                                 ? Color(0xFF0063ad)
//                                 : Color(0xFFF2F2F2).withOpacity(1.0),
//                             child: SvgPicture.asset(
//                               isAlumni?_tabListalumni[index].image:tabListStudent[index].image,
//                               color: _currentIndex != null &&
//                                   _currentIndex == index
//                                   ? Colors.white
//                                   : Color(0xFFAAAAAA).withOpacity(1.0),
//                               height: 13.0,
//                               width: 13.0,
//                             ),
//                           ),
//                           Text(
//                             isAlumni?_tabListalumni[index].title:tabListStudent[index].title,
//                             style: TextStyle(
//                               color: _currentIndex != null &&
//                                   _currentIndex == index
//                                   ? Color(0xFF0063ad)
//                                   : Color(0xFFAAAAAA).withOpacity(1.0),
//                               fontFamily: "Lorin",
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _tabBodyalumni() {
//
//     return Column(
//       children: [
//         _currentIndex == 0
//             ? MostPopularScreen()
//             : _currentIndex == 1
//             ? TrainingScreen()
//             : _currentIndex == 2
//             ? Counseling()
//             : _currentIndex == 3
//             ? WebinarScreen()
//             : _currentIndex == 4
//             ? DiscussionScreen()
//         // : _currentIndex == 5
//         // ? MyApp1()
//             : Container()
//       ],
//     );
//   }
//
//   Widget _tabBodystudent() {
//
//     return Column(
//       children: [
//         _currentIndex == 0
//             ? MostPopularScreen()
//             : _currentIndex == 1
//             ? AluminiScreen()
//             : _currentIndex == 2
//             ? TrainingScreen()
//             : _currentIndex == 3
//             ? Counseling()
//             : _currentIndex == 4
//             ? WebinarScreen()
//             : _currentIndex == 5
//             ? DiscussionScreen()
//         // : _currentIndex == 5
//         // ? MyApp1()
//             : Container()
//       ],
//     );
//   }
//
//   Future getLocation() async {
//     print("Home getting locations...");
//
//     Position position = await GeolocatorPlatform.instance
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//     final coordinates = new Coordinates(position.latitude, position.longitude);
//
//     var addresses =
//     await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = addresses.first;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     setState(()  {
//       prefs.setString('userLocation', first.locality +", "+ first.adminArea +", "+ first.postalCode);
//     });
//     // print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
//
//     return first;
//   }
//
//
// }
