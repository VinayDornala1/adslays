import 'package:flutter/material.dart';

import 'Constant/ConstantsColors.dart';
import 'ThankYouScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List tabBars = ['Personal Details', 'Order Details'];
  int _currentIndex = 0;


  _onSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        top: true,
        right: false,
        bottom: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          22), // if you need this
                    ),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 44,
                          height: 44,

                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                          child: Image.asset(
                            "assets/images/cart.png",
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          22), // if you need this
                    ),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 44,
                          height: 44,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              10, 12, 5, 0),
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 23,
                            height: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "User Profile",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Mont-SemiBold"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(width: 100,child: Divider(height: 1,thickness: 1,color: ConstantColors.appTheme,),),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _previewImage(),

                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Yashwanth Puvvada",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Mont-Regular"
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            const Text(
                              "   +91 99999 99999",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Mont-Light"
                              ),
                            ),
                            const Spacer(),
                            SizedBox(height: 24,width: 2,child: Container(color: ConstantColors.lightGrey,),),
                            const Spacer(),
                            Text(
                              "Unique ID: 13425223",
                              style: TextStyle(
                                  color: ConstantColors.appTheme,
                                  fontSize: 17,
                                  fontFamily: "Mont-Light"
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 20, 0, 0),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: tabBars.map((e) {
                                var index = tabBars.indexOf(e);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _onSelected(index);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        color: _currentIndex == index
                                            ? ConstantColors.appTheme
                                            : Color(0xFFF2F2F2),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            index == 0
                                                ? Image.asset(
                                              "assets/images/user.png",
                                              color: _currentIndex == index ? Colors.white : Colors.black,
                                              width: 14,
                                              height: 14,
                                            )
                                                : Image.asset(
                                              "assets/images/orderDetails.png",
                                              color: _currentIndex == index ? Colors.white : Colors.black,
                                              width: 16,
                                              height: 16,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                                              child: Text(
                                                e.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Mont-Light',
                                                  color: _currentIndex ==
                                                      index
                                                      ? Color(0xFFFFFFFF)
                                                      : Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                        ),
                        Divider(height: 25,thickness: 2,color: ConstantColors.lightGrey,),
                        _currentIndex == 0
                            ? _personalDetails()
                            : _currentIndex == 1
                            ? _orderDetails()
                            : const SizedBox(width: 0,height: 0,)
                      ],
                    )
                ),
              )



            ]),
      ),
    );
  }



  Widget _previewImage() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // _pickImage();
            print("Choose profile image.");
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Stack(fit: StackFit.loose, children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/userprofile.png'),
                          fit: BoxFit.cover,
                        ),
                      ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 88.0, left: 75.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: ConstantColors.lightGrey,
                        radius: 15.0,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
            ]),
          ),
        ),
      ],
    );

  }

  Widget _personalDetails() {

    return GestureDetector(
      onTap: () {
        // _pickImage();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:  [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                children:  [
                  const Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Mont-SemiBold"
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      print("Edit profile clicked.");
                    },
                    child: Container(
                      width: 90,
                      height: 33,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        color: ConstantColors.darkYellow,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/edit.png",
                              color: Colors.black,
                              width: 20,
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 2, 5, 0),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  fontFamily: 'Mont-Regular',
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Your Name',
                  labelText: 'Your Name',

                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Email Address",
                  labelText: "Email Address",

                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextField(

                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',


                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextField(

                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Your Company',
                  labelText: 'Your Company',


                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextField(

                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Your Address',
                  labelText: 'Your Address',

                ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );

  }

  Widget _orderDetails() {

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,//cartList.length,
      itemBuilder: (context, index) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "assets/images/desibg.png",
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Image.asset(
                          "assets/images/desilogo.png",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 8,
                        child: Image.asset(
                          "assets/images/delete.png",
                          fit: BoxFit.fill,
                          height: 45,
                          width: 45,
                        ))

                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 5, 8),
                child: Text(
                  "Desi District - Riverside Dr, Irving, TX",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Mont-SemiBold'
                  ),
                ),
              ),
              Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                    child: Text(
                      "\$3.00",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Mont-Regular',
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                    child: Text(
                      "UPLOAD AD!",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontFamily: 'Mont-Regular',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Image.asset(
                      "assets/images/link.png",
                      fit: BoxFit.fill,
                      height: 20,
                      width: 20,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Card(
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: SizedBox(
                            height: 75,
                            //width: MediaQuery.of(context).size.width * 0.23,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "SCREEN SIZE",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Mont-Regular',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "40 Inch",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Mont-SemiBold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: SizedBox(
                            height: 75,
                            //width: MediaQuery.of(context).size.width * 0.23,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "NO OF TIMES",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Mont-Regular',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "2 Times",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Mont-SemiBold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: SizedBox(
                            height: 75,
                            //width: MediaQuery.of(context).size.width * 0.19,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "TOTAL",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Mont-Regular',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "\$21.00",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Mont-SemiBold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  24), // if you need this
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 48,
                                  height: 48,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5,8,5,0),
                                  child: Image.asset(
                                    "assets/images/blueRightArrow.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ]
        );
      },
    );

  }



}
