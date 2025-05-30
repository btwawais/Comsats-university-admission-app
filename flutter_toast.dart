import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFlutterToast {
  void toastmessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: const Color.fromARGB(255, 54, 57, 244),
        textColor: const Color.fromARGB(255, 253, 253, 255),
        fontSize: 16.0);
  }
}
