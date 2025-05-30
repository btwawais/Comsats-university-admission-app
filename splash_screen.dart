import 'package:cui_admission/statemanagement/splash_specification.dart';
import 'package:cui_admission/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Call the function from the provider in initState
    Future.microtask(() {
      Provider.of<SplashSpecification>(context, listen: false).islogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CupertinoColors.systemBlue,
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset("images/logo.png"),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Cui",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        color: Colors.black
                            .withOpacity(0.1), // Choose the color of the shadow
                        blurRadius:
                            3.0, // Adjust the blur radius for the shadow effect
                        offset: Offset(10.0,
                            5.0), // Set the horizontal and vertical offset for the shadow
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
