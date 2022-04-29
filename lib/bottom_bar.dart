import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart'; //yashwanth
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BoolProvider.dart';
import 'HistoryScreen.dart';
import 'MainScreen.dart';
import 'ProfileScreen.dart';
import 'StoresList.dart';

class BottomNavigationMenu extends StatefulWidget {
  static int indexbottom=0;
  @override
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  int _index = 0;

  _onSelected(int index) {
    setState(() {
      _index = index;
    });
  }

  // int _selectedPage = 0;
  List<Widget> pageList=[
    MainScreen(),
    StoresList(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  onItemTapped(int index) {
    setState(() {
      // _selectedPage = index;
      BottomNavigationMenu.indexbottom=index;
      _boolProvider.setBottomChange(index);
      if(index==0){
        print('dfcgfg');
        _boolProvider.setBottomChange(0);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => BottomNavigationMenu(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigationMenu()));
      }
      if(index==1){
        print('dfcgfg');
        _boolProvider.setBottomChange(1);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => BottomNavigationMenu(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigationMenu(),));
      }if(index==2){
        print('dfcgfg');
        _boolProvider.setBottomChange(2);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => BottomNavigationMenu(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigationMenu()));
      }if(index==3){
        print('dfcgfg');
        _boolProvider.setBottomChange(3);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => BottomNavigationMenu(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigationMenu()));
      }
    });

  }

  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration.zero, () {
      initOneSignal(); //yashwanth
    });

  }

  bool _requireConsent = false;

  Future<void> initOneSignal() async { //yashwanth
    // try {
    //   var deviceState = await OneSignal.shared.getPermissionSubscriptionState();
    //   var playerId = deviceState.subscriptionStatus.userId;
    //   print('Player ID: ' + playerId);
    //   print('-------------' + playerId);
    //   String url1 = APIConstant.base_url + "StudentsAPI/TokenUpdate?Email="+email+"&TokenNo="+playerId+"&Type=Student";
    //   url1 = url1.replaceAll('+', '');
    //   print(''+url1);
    //   Response response=await get(Uri.parse(url1));
    //   Map data = jsonDecode(response.body);
    //   print(data);
    // }catch (error) {
    //
    // }
  }

  List<Widget> _pages() {
    return [
      MainScreen(),
      StoresList(),
      HistoryScreen(),
      ProfileScreen(),
    ];
  }

  static const int totalPage = 4;

  static const List<String> names = [
    'Home',
    'Search',
    'Application',
    'Profile',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.movie,
    Icons.timer,
    Icons.multiline_chart
  ];

  BoolProvider _boolProvider = BoolProvider();
  @override
  Widget build(BuildContext context) {
    _boolProvider = Provider.of<BoolProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _boolProvider.indexes,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 13,
          fontFamily: "Lorin",
          color: Color(0xFF9D9D9D),
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontFamily: "Lorin",
          color: Color(0xFF9D9D9D),
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset("assets/images/home-icon2.png",width: 25,height: 25),

            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child:Image.asset("assets/images/home-icon.png",width: 25,height: 25,color: Color(0xFF0063AD)),
              // child: SvgPicture.asset(
              //   'assets/images/hom.svg',
              //   height: 20,
              //   color: Color(0xFF0063AD),
              // ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset("assets/images/stores.png",width: 25,height: 25),

            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child:Image.asset("assets/images/stores2.png",width: 25,height: 25),

            ),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset("assets/images/history.png",width: 25,height: 25),

            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child:Image.asset("assets/images/history.png",width: 25,height: 25,color: Color(0xFF0063AD)),

            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset("assets/images/profile.png",width: 25,height: 25),

            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child:Image.asset("assets/images/profile2.png",width: 25,height: 25),

            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _boolProvider.indexes,
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFF0063AD),
        onTap: onItemTapped,
      ),

    );
  }
}
