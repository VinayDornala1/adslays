import 'dart:convert';

import 'package:adslay/CartScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'API.dart';
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

  bool isLoading = true;
  bool isCheckoutAvailable = false;
  List<dynamic> ordersHistoryList = [];
  List<dynamic> userDetails = [];

  String email = '';
  String mobileNumber = '';
  double subTotalValue = 0.0;

  late ProgressDialog pr;


  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController profileImage = TextEditingController();
  TextEditingController addressController = TextEditingController();


  Future<void> getData() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
      });
    }catch(e){
      print(e);
    }
    String url1 = APIConstant.getCartHistoryItems;
    print("Get orders history items url is: "+url1);
    Map<String, dynamic> body = {
      'Mobile': '9160747554',
    };
    print('Get orders history items api body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    //print('Get orders history items response :' + response.body.toString());
    setState(() {
      ordersHistoryList = jsonDecode(response.body)['OrdersList'];
    });

    if (ordersHistoryList.isEmpty) {
      print("No orders history found.");
      isCheckoutAvailable = false;
    }
    else{
      for (var item in ordersHistoryList) {
        double actualPrice = item["ActualPrice"];
        subTotalValue += actualPrice;
        //print("Cart items actual prices are: "+actualPrice.toString());
      }
      isCheckoutAvailable = true;
      print("Cart items total price: "+subTotalValue.toString());
    }
    _getUserProfileDetails();

    setState(() {
      isLoading=false;
    });
  }

  Future<void> _getOrdersHistory() async {

    String url1 = APIConstant.getCartHistoryItems;
    print("Get orders history items url is: "+url1);
    Map<String, dynamic> body = {
      'Mobile': '9160747554',
    };
    print('Get orders history items api body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    //print('Get orders history items response :' + response.body.toString());
    setState(() {
      ordersHistoryList = jsonDecode(response.body)['OrdersList'];
    });

    if (ordersHistoryList.isEmpty) {
      print("No orders history found.");
      isCheckoutAvailable = false;
    }
    else{
      for (var item in ordersHistoryList) {
        double actualPrice = item["ActualPrice"];
        subTotalValue += actualPrice;
        //print("Cart items actual prices are: "+actualPrice.toString());
      }
      isCheckoutAvailable = true;
      print("Cart items total price: "+subTotalValue.toString());
    }

    setState(() {
      isLoading=false;
    });
  }

  Future<void> _getUserProfileDetails() async {

    String url1 = APIConstant.login;
    print(url1);
    Map<String, dynamic> body = {
      'MobileNo': '9160747554',
    };
    print("Profile get details api calling :" + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );

    Map data = jsonDecode(response.body);
    print(data);
    String msg = data['msg'];
    print(msg);

    if (msg=='No Records Found') {

    } else {
      setState(() {

        userNameController.text = data['objCustomers']['FirstName'] + " " + data['objCustomers']['LastName'];
        emailController.text = data['objCustomers']['Email'];
        mobileNumberController.text = data['objCustomers']['MobileNo'];
        profileImage.text = data['objCustomers']['ProfileImage'];
        var FirstName = data['objCustomers']['FirstName'];
        var LastName = data['objCustomers']['LastName'];
        var Email = data['objCustomers']['Email'];
        var MobileNo = data['objCustomers']['MobileNo'];


        userNameController.text =  FirstName+ " " + LastName;
      });
    }

    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  String profilePic='';
  final String uploadUrl = APIConstant.postProfilePicToServer;
  TextEditingController vendor_image = new TextEditingController();

  _tenthFilepicker() async {
    var picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    );
    if (picked != null) {
      setState(() {
        profilePic = picked.files.first.path!;
      });
      print('file path: '+picked.files.first.path!);
      await pr.show();
      var res = await uploadImage( picked.files.first.path, uploadUrl);
      print("Profile pic uploading to server response: "+ res.toString());
      Map data1 = jsonDecode(res);
      String fileName = picked.files.first.path!.split('/').last;
      print('Uploaded file name: '+data1.toString());

      vendor_image.text = data1['fileName'].toString();
      String url1 = APIConstant.postProfilePicDetailsToServer;
      print('Upload profile pic details to server url: '+url1);
      Map<String, dynamic> body = {
        'MobileNo': '9160747554',
        'ProfileImage': vendor_image.text.toString(),
      };
      print('Upload profile pic details to server body:' + body.toString());
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final encoding = Encoding.getByName('utf-8');
      final response = await post(
        Uri.parse(url1),
        headers: headers,
        body: body,
        encoding: encoding,
      );
      print('Upload profile pic details to server data :' + response.body.toString());
      await pr.hide();
      setState(() {
        isLoading = true;
        // getdata();
      });
    }
  }

  Future<String> uploadImage(filepath, url) async {
    var request = MultipartRequest('POST', Uri.parse(url));
    request.files.add(await MultipartFile.fromPath('file', filepath));
    var res = await request.send();
    var responseString = await res.stream.bytesToString();
    print('Upload image to server data response: '+responseString);
    return responseString;
  }


  _onSelected(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 1){
        _getOrdersHistory();
      }else if (index == 0){
        _getUserProfileDetails();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(
        message: 'Loading',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
            padding: const EdgeInsets.all(10.0),
            child: const CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600)
    );


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
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 10),
                  //     child: Image.asset(
                  //       "assets/images/back.png",
                  //       width: 45,
                  //       height: 65,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0, right: 30, left: 10),
                      child: Image.asset(
                        "assets/images/home-logo.png", width: 130,)
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            21.5), // if you need this
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: 43,
                            height: 43,

                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(7, 10, 5, 0),
                            child: Image.asset(
                              "assets/images/cart.png",
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          21.5), // if you need this
                    ),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 43,
                          height: 43,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              10, 10, 5, 0),
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 25,
                            height: 25,
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

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "" + userNameController.text,
                              style: const TextStyle(
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
                            Text(
                              "+91 $mobileNumber",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Mont-Light",
                                  color: ConstantColors.appTheme,
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
                            ? _ordersHistoryItems()
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
            _tenthFilepicker();
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
            // Padding(
            //   padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            //   child: TextField(
            //     //controller: nameController,
            //     decoration: const InputDecoration(
            //       enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       focusedBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       filled: true,
            //       fillColor: Colors.transparent,
            //       hintText: 'Enter Your Name',
            //
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            //   child: TextField(
            //     controller: addressController,
            //     decoration: const InputDecoration(
            //       enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       focusedBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       filled: true,
            //       fillColor: Colors.transparent,
            //       hintText: 'Enter Your Address',
            //
            //     ),
            //   ),
            // ),
            //
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children:   [
            //     Flexible(
            //       child: Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
            //         child: CountriesList == null
            //             ? const SizedBox(height: 0, width: double.infinity)
            //             : Column(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            //               child: DropdownButton(
            //                 icon: const Icon(
            //                   Icons
            //                       .arrow_drop_down_circle_outlined,
            //                   size: 15,
            //                 ),
            //                 dropdownColor:
            //                 Colors.white,
            //                 isExpanded: true,
            //                 underline: SizedBox(),
            //                 hint: const Text(
            //                   'Select Country',
            //                   style: TextStyle(
            //                       fontFamily:
            //                       "Lorin",
            //                       fontWeight:
            //                       FontWeight
            //                           .w700,
            //                       fontSize: 14.0,
            //                       color: Color(
            //                           0xFF141E28)),
            //                 ),
            //                 value: countryController.text != '' ? countryController.text : null,
            //                 items: CountriesList
            //                     .map((item) {
            //                   return DropdownMenuItem(
            //                     child: Text(
            //                       item['CountryName'],
            //                       style: const TextStyle(
            //                           color: Color(
            //                               0xFF000000)),
            //                     ),
            //                     value: item['CountryName']
            //                         .toString(),
            //                   );
            //                 }).toList(), onChanged: (Object? value) {
            //                 setState(() {
            //                   print('' + value!.toString());
            //                   countryController.text =
            //                       value.toString();
            //                   for(int i=0;i<CountriesList.length;i++){
            //                     if(countryController.text==CountriesList[i]['CountryName']){
            //                       countryControllerId.text=CountriesList[i]['CountryId'].toString();
            //                     }
            //                   }
            //                   loadstates();
            //                 });
            //               },
            //
            //               ),
            //             ),
            //             const Divider(thickness: 1,height: 1,color: Colors.grey,)
            //           ],
            //         ),
            //       ),
            //     ),
            //     Flexible(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
            //         child: statelists == null ? const SizedBox(height: 0, width: double.infinity)
            //             : Column(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            //               child: DropdownButton(
            //                 icon: const Icon(
            //                   Icons
            //                       .arrow_drop_down_circle_outlined,
            //                   size: 15,
            //                 ),
            //                 dropdownColor:
            //                 Colors.white,
            //                 isExpanded: true,
            //                 underline: SizedBox(),
            //                 hint: const Text(
            //                   'Select State',
            //                   style: TextStyle(
            //                       fontFamily:
            //                       "Lorin",
            //                       fontWeight:
            //                       FontWeight
            //                           .w700,
            //                       fontSize: 14.0,
            //                       color: Color(
            //                           0xFF141E28)),
            //                 ),
            //                 value: stateController.text != '' ? stateController.text : null,
            //                 items: statelists
            //                     .map((item) {
            //                   return DropdownMenuItem(
            //                     child: Text(
            //                       item['StateName'],
            //                       style: const TextStyle(
            //                           color: Color(
            //                               0xFF000000)),
            //                     ),
            //                     value: item['StateName']
            //                         .toString(),
            //                   );
            //                 }).toList(), onChanged: (Object? value) {
            //                 setState(() {
            //                   print('' + value!.toString());
            //                   stateController.text =
            //                       value.toString();
            //                   // for(int i=0;i<CountriesList.length;i++){
            //                   //   if(countryController.text==CountriesList[i]['CountryName']){
            //                   //     countryControllerId.text=CountriesList[i]['CountryId'].toString();
            //                   //   }
            //                   // }
            //                   // loadstates();
            //                 });
            //               },
            //
            //               ),
            //             ),
            //             const Divider(thickness: 1,height: 1,color: Colors.grey,)
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children:   [
            //     Flexible(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
            //         child: TextField(
            //           controller: cityController,
            //           decoration: const InputDecoration(
            //             enabledBorder: UnderlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey),
            //             ),
            //             focusedBorder: UnderlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey),
            //             ),
            //             filled: true,
            //             fillColor: Colors.transparent,
            //             hintText: 'Select City',
            //
            //           ),
            //         ),
            //       ),
            //     ),
            //     Flexible(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
            //         child: TextField(
            //           controller: zipcodeController,
            //           keyboardType: TextInputType.number,
            //           decoration: const InputDecoration(
            //             enabledBorder: UnderlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey),
            //             ),
            //             focusedBorder: UnderlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey),
            //             ),
            //             filled: true,
            //             fillColor: Colors.transparent,
            //             hintText: 'Enter Zip Code ',
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            //
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
                  hintText: 'Enter Your Name',

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
                  hintText: 'Enter Company Name',

                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
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
                        hintText: 'City',
                        // suffixIcon:  Icon(
                        //   Icons.arrow_drop_down,
                        // ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
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
                        hintText: 'State',
                        suffixIcon:  Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
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
                        hintText: 'Country',
                        suffixIcon:  Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 15, 0),
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
                        hintText: 'Enter Zip Code ',

                      ),
                    ),
                  ),
                ),
              ],
            ),


            const SizedBox(height: 50)
          ],
        ),
      ),
    );

  }

  Widget _ordersHistoryItems() {
    return isLoading
        ? Shimmer.fromColors(
        baseColor: ConstantColors.lightGrey,
        highlightColor: Colors.white,
        enabled: true,
        child: ListView(
          shrinkWrap: true, // use it
          physics: const BouncingScrollPhysics(),
          children: [
            GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 1.5,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(10, (index) {
                return InkWell(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.width * 0.40,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(height: 10,width: 10,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 10,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              ),
            )
          ],
        )
    )
        : ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: ordersHistoryList.length,
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
                        Card(
                          elevation: 1,
                          child: Image.network(
                            ordersHistoryList[index]["ImageUrl"],
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(8.0),
                        //   child: Image.asset(
                        //     "assets/images/desibg.png",
                        //     height: 160,
                        //     width: MediaQuery.of(context).size.width,
                        //     fit: BoxFit.fitWidth,
                        //   ),
                        // )
                      ],
                    ),

                    // Positioned(
                    //     top: 10,
                    //     right: 8,
                    //     child: Image.asset(
                    //       "assets/images/delete.png",
                    //       fit: BoxFit.fill,
                    //       height: 45,
                    //       width: 45,
                    //     ))

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 5, 8),
                child: Text(
                  "" + ordersHistoryList[index]["StoreName"] +", "+ ordersHistoryList[index]["City"] +", "+ ordersHistoryList[index]["State"],
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Mont-SemiBold'
                  ),
                ),
              ),
              Row(
                children:  [
                  // const Padding(
                  //   padding: EdgeInsets.fromLTRB(15, 5, 5, 8),
                  //   child: Text(
                  //     "\$3.00",
                  //     maxLines: 2,
                  //     style: TextStyle(
                  //       fontSize: 18.0,
                  //       fontFamily: 'Mont-Regular',
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),
                  const Spacer(),
                  (ordersHistoryList[index]["IsFileUpload"] == "Yes") ?const Padding(
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
                  ):const SizedBox(width: 0,height: 0,),
                  (ordersHistoryList[index]["IsFileUpload"] == "Yes") ?Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Image.asset(
                      "assets/images/link.png",
                      fit: BoxFit.fill,
                      height: 20,
                      width: 20,
                    ),
                  ):const SizedBox(width: 0,height: 0,),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    const Padding(
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
                                        "" + ordersHistoryList[index]["ScreenSize"].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    const Padding(
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
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        "" + ordersHistoryList[index]["NoofTimes"].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    const Padding(
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
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        // "\$21.00",
                                        "\$" + ordersHistoryList[index]["ActualPrice"].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
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
