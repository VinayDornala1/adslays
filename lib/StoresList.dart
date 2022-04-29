import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoresList extends StatefulWidget {

  @override
  _StoresList createState() => _StoresList();

}

class _StoresList extends State<StoresList> {


  @override
  void initState() {
    // TODO: implement initState
    //SystemChannels.textInput.invokeMethod('TextInput.hide');


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }


}
