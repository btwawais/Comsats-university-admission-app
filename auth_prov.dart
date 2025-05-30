import 'package:cui_admission/authentication/signin.dart';
import 'package:cui_admission/screenfit/home.dart';

import 'package:cui_admission/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class EmailAuthProv with ChangeNotifier {
  bool _signinloading = false;
  bool _signuploading = false;

  var signupformkey = GlobalKey<FormState>();
  var signinformkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController signupname = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  TextEditingController loginmail = TextEditingController();
  TextEditingController loiginpassword = TextEditingController();

  bool get signuploading => _signuploading;
  set signuploading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  bool get signinloading => _signinloading;
  set signinloading(bool value) {
    _signinloading = value;
    notifyListeners();
  }

  MyFlutterToast myFlutterToast = MyFlutterToast();
  Future signup(context) async {
    signuploading = true;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: signupemail.text,
        password: signuppassword.text,
      );

      signuploading = false;
      myFlutterToast.toastmessage(userCredential.user?.email ?? "No email");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
      );
    } on FirebaseAuthException catch (e) {
      signuploading = false;
      myFlutterToast.toastmessage(e.message ?? "Signup failed");
      print("FirebaseAuthException: ${e.message}");
    } catch (e) {
      signuploading = false;
      myFlutterToast.toastmessage("Unexpected error: $e");
      print("Unexpected error: $e");
    }
    notifyListeners();
  }

  Future signin(context) async {
    signinloading = true;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: loginmail.text,
        password: loiginpassword.text,
      );

      signinloading = false;
      myFlutterToast.toastmessage(
        'Logged in as: ${userCredential.user?.email ?? "unknown"}',
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FitnessApp()),
      );
    } on FirebaseAuthException catch (e) {
      signinloading = false;
      myFlutterToast.toastmessage(e.message ?? "Login failed");
    } catch (e) {
      signinloading = false;
      myFlutterToast.toastmessage("Unexpected error: $e");
      print("Unexpected error: $e");
    }
    notifyListeners();
  }
}
