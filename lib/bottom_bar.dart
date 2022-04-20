import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bool_provider.dart';

class BottomNavigationMenu extends StatefulWidget {
  static int indexbottom=0;

  const BottomNavigationMenu({Key? key}) : super(key: key);
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

 // List<Widget> pageList = List<Widget>();

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

  }

  late BoolProvider _boolProvider;

  @override
  Widget build(BuildContext context) {
    _boolProvider = Provider.of<BoolProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _boolProvider.indexes,
        //children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontFamily: "Lorin",
          color: Color(0xFF9D9D9D),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontFamily: "Lorin",
          color: Color(0xFF9D9D9D),
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/user.png",height: 18,width: 18,)
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child: Image.asset("assets/images/user.png",height: 25,width: 25,)
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset("assets/images/user.png",height: 18,width: 18,)
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child: Image.asset("assets/images/user.png",height: 25,width: 25,)
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Image.asset("assets/images/user.png",height: 18,width: 18,)
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
              child: Image.asset("assets/images/user.png",height: 25,width: 25,)
            ),
            label: 'Application',
          ),
          BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/user.png",height: 18,width: 18,)
            ),
            activeIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 5),
                child:
                Image.asset("assets/images/user.png",height: 25,width: 25,)
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
