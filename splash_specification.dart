import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cui_admission/authentication/signin.dart';
import 'package:cui_admission/screens/bottom.dart';

import 'package:flutter/material.dart';

class SplashSpecification with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  void islogin(BuildContext context) {
    final user = auth.currentUser;
    if (user != null) {
      print('ff');
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottom()),
        );
      });
    } else {
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Signin()),
        );
      });
    }
    notifyListeners();
  }
}
