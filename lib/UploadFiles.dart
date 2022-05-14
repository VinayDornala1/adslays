import 'dart:convert';

import 'package:adslay/ChoosePlan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API.dart';
import 'CartScreen.dart';



class UploadFiles extends StatefulWidget {

  var storeId;
  var cartId;


  UploadFiles({this.storeId,this.cartId});

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {



  String email = '';
  String mobileNumber = '';
  late DateTime pickedDate;

  final selecteddate = TextEditingController();

  late TimeOfDay time;
  bool isLoading = true;
  String deviceOS = '';

  // int storeId = 0;
  String title = '';
  String city = '';
  String state = '';
  String country = '';
  String zipCode = '';
  String imageUrl = '';
  String screenSize = '';
  int durationInDays = 0;
  double actualPrice = 0.0;
  double offerPrice = 0.0;
  String footTraffic = '';
  String type = '';
  String fileFormat = '';
  String? selectedCountryName;
  String? selectedCountryNameTimes;

  TextEditingController vendor_image = new TextEditingController();


  List<dynamic> screenSizeList = [];
  List<dynamic> noOfTimesList = [];
  List<dynamic> storePackagesList = [];
  List<dynamic> data1 = [];

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

    setState(() {
      isLoading = false;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mobileNumber = prefs.getString('mobilenumber')!;
        email = prefs.getString('email')!;
      });
    } catch (e) {
      print(e);
    }

    String url1 = APIConstant.getStoreDetails;
    print('Category base StoresList url: ' + url1);
    Map<String, dynamic> body = {
      'Mobile': '9160747554',
      'StoreId': widget.storeId.toString(),
    };

    print('Category base StoresList body:' + body.toString());
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final encoding = Encoding.getByName('utf-8');
    final response = await post(
      Uri.parse(url1),
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print('Category base StoresList response :' + response.body.toString());
    setState(() {
      String msg = jsonDecode(response.body)['msg'];

      if (msg == "Success" || msg == "success") {
        title = jsonDecode(response.body)['Title'];
        city = jsonDecode(response.body)['City'];
        state = jsonDecode(response.body)['State'];
        zipCode = jsonDecode(response.body)['ZipCode'];
        imageUrl = jsonDecode(response.body)['ImageUrl'];
        screenSize = jsonDecode(response.body)['ScreenSize'];
        durationInDays = jsonDecode(response.body)['DurationinDays'];
        actualPrice = jsonDecode(response.body)['ActualPrice'];
        offerPrice = jsonDecode(response.body)['OfferPrice'];
        footTraffic = jsonDecode(response.body)['FootTraffic'];
        type = jsonDecode(response.body)['Type'];
        fileFormat = jsonDecode(response.body)['FileFormat'];

        screenSizeList = jsonDecode(response.body)['ScreenSizeList'];
        print('strr:   ' + screenSizeList.toString());
        print('strr:   ' + screenSizeList[0]['ScreenSize'].toString());
        noOfTimesList = jsonDecode(response.body)['NoofTimesList'];
        // storePackagesList = jsonDecode(response.body)['StorePackagesList'];

      } else {
        print("Unable to get API response.");
      }
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    getData();
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
        context: this.context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime(DateTime.now().year + 50));
    if (date != null) {
      setState(() {
        pickedDate = date;
        selecteddate.text='${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(
        message: 'Loading',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
            padding: EdgeInsets.all(10.0), child: CircularProgressIndicator()),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600));
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: false,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
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
                            padding: const EdgeInsets.only(top: 0, right: 30,left: 10),
                            child: Image.asset("assets/images/home-logo.png",width: 130,)
                        ),
                        const Spacer(),
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 220,//MediaQuery.of(context).size.width * 0.50,
                          //   alignment: Alignment.center,
                          //   child: Image(
                          //     fit: BoxFit.fill,
                          //     image: NetworkImage(imageUrl),
                          //     width: double.infinity,
                          //   ),
                          // ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Card(
                                  elevation: 2,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 220,//MediaQuery.of(context).size.width * 0.60,
                                      alignment: Alignment.center,
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        placeholder: (context, url) => const Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset("assets/images/logo.jpg"),
                                        //const Icon(Icons.refresh_outlined),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        // height: 150,
                                      )
                                  ),
                                )
                            ),
                          ),
                          // Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 220,//MediaQuery.of(context).size.width * 0.60,
                          //     alignment: Alignment.center,
                          //     child: CachedNetworkImage(
                          //       imageUrl: imageUrl,
                          //       placeholder: (context, url) => const Center(
                          //           child: CircularProgressIndicator()),
                          //       errorWidget: (context, url, error) =>
                          //           Image.asset("assets/images/logo.jpg"),
                          //       //const Icon(Icons.refresh_outlined),
                          //       fit: BoxFit.cover,
                          //       width: double.infinity,
                          //       // height: 150,
                          //     )
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 5, 8),
                  child: Text(
                    "$title - $city,$state,$country",
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _tenthFilepicker();
                  },
                  child: SizedBox(
                    //height: 220,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 80),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                    child: Container(
                                      height: 230,
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 80),
                                          const Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Upload your files or Browse",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),

                                            ),
                                          ),
                                          // SizedBox(height: 40),
                                          GestureDetector(
                                            onTap: (){
                                              _pickDate();
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                                    child: TextField(
                                                      onTap: (){
                                                        _pickDate();
                                                      },
                                                      readOnly: true,
                                                      controller: selecteddate,
                                                      decoration: InputDecoration(
                                                        enabledBorder: const UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.grey),
                                                        ),
                                                        focusedBorder: const UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.grey),
                                                        ),
                                                        filled: true,

                                                        fillColor: Color(0xFFFFFFFF),
                                                        hintText: 'Select start date',
                                                        suffixIcon:  Container(
                                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                                          child: const Image(
                                                            image: AssetImage(
                                                              'assets/images/calender.png',
                                                            ),
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80), // if you need this
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 160,
                                  height: 160,
                                  child: Image.asset(
                                    "assets/images/uploadfiles.png",
                                    fit: BoxFit.cover,
                                    height: 160,
                                    width: 160,
                                  ),

                                ),

                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          //top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                              },
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.60,
                                height: 45,
                                decoration:  const BoxDecoration(
                                    gradient:  LinearGradient(
                                      colors: [
                                        Color(0xff3962cb),
                                        Color(0xff3962cb),
                                      ],
                                    )
                                ),
                                //padding: const EdgeInsets.all(10.0),
                                child: const Center(
                                  child: Text(
                                    "BOOK NOW",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Lorin"
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ]),
        ),
      ),
    );
  }


  String tenthDoc='';
  final String uploadUrl = APIConstant.base_url + 'StoresAPI/CustomerBookImages';
  late ProgressDialog pr;

  _tenthFilepicker() async {

    var picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf',],
    );

    if (picked != null) {
      setState(() {
        tenthDoc = picked.files.first.path!;

      });
      print(''+picked.files.first.path!);
      await pr.show();

      var res = await uploadImage( picked.files.first.path, uploadUrl);
      print(res);
      Map data1 = jsonDecode(res);
      String fileName = picked.files.first.path!.split('/').last;
      print(fileName);
      vendor_image.text = data1['fileName'].toString();

      String url1 = APIConstant.base_url + "StoresAPI/CustomerBookImageAPI";
      print('Category base StoresList url: '+url1);
      Map<String, dynamic> body = {
        'MobileNo': '9160747554',
        'CartDetailId': widget.storeId.toString(),
        'ImageUrl': fileName.toString(),
        'VideoUrl': fileName.toString(),
        'StartDate': '',

      };
      print('Category base StoresList body:' + body.toString());
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final encoding = Encoding.getByName('utf-8');
      final response = await post(
        Uri.parse(url1),
        headers: headers,
        body: body,
        encoding: encoding,
      );
      print('Category base StoresList response :' + response.body.toString());

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
    print(responseString);
    return responseString;
  }

}
