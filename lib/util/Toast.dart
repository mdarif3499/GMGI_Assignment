import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastmessage(String msg,{color}) {

  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: color==null?Colors.red:Colors.green,
    textColor: Colors.white,
    fontSize: 16,
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 4,
  );
}
