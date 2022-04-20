// import 'package:flutter/material.dart';
//
//
// class NavgationDrawer extends StatefulWidget {
//   const NavgationDrawer({Key? key}) : super(key: key);
//
//   @override
//   _NavgationDrawerState createState() => _NavgationDrawerState();
// }
//
// class _NavgationDrawerState extends State<NavgationDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//         drawer: Container(
//           width: 100,
//           child: Drawer(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/sideprofile.svg'),
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/Application.svg'),
//                         Text(
//                           'Application',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/sidecounseling.svg'),
//                         Text(
//                           'Counselling ',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/sidediss.svg'),
//                         Text(
//                           'Discussions',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/sidetraining.svg'),
//                         Text(
//                           'Training',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/sideevents.svg'),
//                         Text(
//                           'Events',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         //SvgPicture.asset('assets/icons/sideshare.svg'),
//                         Text(
//                           'Share App',
//                           style: TextStyle(
//                             color: Color(0xFF141E28),
//                             fontFamily: "Lorin",
//                             fontSize: 10,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         appBar: AppBar(
//           backgroundColor: Color(0xFFFAFAFA),
//           elevation: 0,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0.0, 0, 24, 0),
//               child: GestureDetector(
//                 onTap: () {
//
//                 },
//                 child: Image.asset(
//                   'assets/icons/notification.png',
//                   height: 40,
//                   width: 40,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // construct the profile details widget here
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
//               child: Text(
//                 'Create your own future',
//                 style: TextStyle(
//                     color: Color(0xFF0063AD).withOpacity(1.0),
//                     fontSize: 24,
//                     fontStyle: FontStyle.normal,
//                     letterSpacing: 0.5,
//                     wordSpacing: 2,
//                     fontWeight: FontWeight.w800,
//                     fontFamily: "Lorin"),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(24, 5, 0, 0),
//               child: Text(
//                 'Search or get a shortlist of courses suitable\nfor you and start applying',
//                 style: TextStyle(
//                     color: Color(0xFF141E28),
//                     fontSize: 12,
//                     letterSpacing: 0.5,
//                     fontStyle: FontStyle.normal,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: "Lorin"),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 19, 24, 0),
//               child: GestureDetector(
//                 onTap: () {
//
//                 },
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Color(0xFFFFFFFF),
//                       borderRadius: BorderRadius.circular(13.0),
//                       border: Border.all(color: Color(0xFFF2F2F2), width: 1)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Text(
//                         'Search Course / University',
//                         style: TextStyle(
//                             color: Color(0xFFAAAAAA),
//                             fontFamily: 'lorin',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       //SvgPicture.asset('assets/icons/Search.svg')
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 14, 24, 0),
//               child: Container(
//                 height: 150,
//                 child: CarouselSlider(
//                     items: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/images/Card.png'),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           height: 200,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(
//                                   'assets/images/training-banner.jpg'),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           height: 200,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(
//                                   'assets/images/counselling-banner.jpg'),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           height: 200,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(
//                                   'assets/images/Webinars banner.jpg'),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           height: 200,
//                           width: double.infinity,
//                         ),
//                       ),
//                     ],
//                     options: CarouselOptions(
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
//                     )),
//               ),
//             ),
//
//             // the tab bar with two items
//             SizedBox(
//               height: 50,
//               child: AppBar(
//                 bottom: TabBar(
//                   indicator: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10), // Creates border
//                       color: Color(0xFF0063aD)),
//                   isScrollable: true,
//                   tabs: [
//                     Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   Color(0xFFF2F2F2).withOpacity(1.0),
//                               child: SvgPicture.asset(
//                                 "assets/icons/Star.svg",
//                                 color: Color(0xFFAAAAAA).withOpacity(1.0),
//                                 height: 13.79,
//                                 width: 17.79,
//                               ),
//                             ),
//                             Text(
//                               'Most Popular',
//                               style: TextStyle(
//                                 color: Color(0xFFFFFFFF).withOpacity(1.0),
//                                 fontFamily: "Lorin",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0.0, 8, 8, 8),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   Color(0xFFF2F2F2).withOpacity(1.0),
//                               child: SvgPicture.asset(
//                                 "assets/icons/training.svg",
//                                 color: Color(0xFFAAAAAA),
//                                 height: 13.79,
//                                 width: 17.79,
//                               ),
//                             ),
//                             Text(
//                               'Training',
//                               style: TextStyle(
//                                 color: Color(0xFFFFFFFF).withOpacity(1.0),
//                                 fontFamily: "Lorin",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   Color(0xFFF2F2F2).withOpacity(1.0),
//                               child: SvgPicture.asset(
//                                 "assets/icons/counseling.svg",
//                                 height: 13.79,
//                                 width: 17.79,
//                               ),
//                             ),
//                             Text(
//                               'Counseling',
//                               style: TextStyle(
//                                 color: Color(0xFFFFFFFF).withOpacity(1.0),
//                                 fontFamily: "Lorin",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   Color(0xFFF2F2F2).withOpacity(1.0),
//                               child: Icon(Icons.play_circle_outline_outlined,
//                                   size: 16, color: Color(0xFFAAAAAA)),
//                             ),
//                             Text(
//                               'Webinar',
//                               style: TextStyle(
//                                 color: Color(0xFFFFFFFF).withOpacity(1.0),
//                                 fontFamily: "Lorin",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   Color(0xFFF2F2F2).withOpacity(1.0),
//                               child: SvgPicture.asset(
//                                 "assets/icons/discussion.svg",
//                                 height: 13.79,
//                                 width: 17.79,
//                               ),
//                             ),
//                             Text(
//                               'Discussion',
//                               style: TextStyle(
//                                 color: Color(0xFFFFFFFF).withOpacity(1.0),
//                                 fontFamily: "Lorin",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor:
//                                   Color(0xFFF2F2F2).withOpacity(1.0),
//                               child: SvgPicture.asset(
//                                 "assets/icons/discussion.svg",
//                                 height: 13.79,
//                                 width: 17.79,
//                               ),
//                             ),
//                             Text(
//                               'Play Quiz',
//                               style: TextStyle(
//                                 color: Color(0xFFFFFFFF).withOpacity(1.0),
//                                 fontFamily: "Lorin",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//
//             // create widgets for each tab bar here
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   // first tab bar view widget
//                   MainScreen(),
//                   TrainingScreenBackup(),
//                   CounselingBackup(),
//                   WebinarScreenBackup(),
//                   DiscussionBackup(),
//                   MyApp1Backup(),
//
//                   // second tab bar viiew widget
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
