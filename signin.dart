import 'package:cui_admission/authentication/signup.dart';
import 'package:cui_admission/statemanagement/auth_prov.dart';
import 'package:cui_admission/utils/app_colors.dart';
import 'package:cui_admission/widgets/button.dart';
import 'package:cui_admission/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailauthprov = Provider.of<EmailAuthProv>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                color: AppColor.primary,
                width: double.infinity,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 47),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 25,
                        ),
                        color: Colors.white,
                        iconSize: 40,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Enter your Registered Email and Password to continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Form(
                key: emailauthprov.signinformkey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: 'Enter Your Email',
                      label: 'Email',
                      controller: emailauthprov.loginmail,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter Your Email';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'ENter Your Password',
                      label: 'Password',
                      controller: emailauthprov.loiginpassword,
                      obscustext: true,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                    ),
                    SizedBox(height: 50),
                    MyButton(
                      ontap: () {
                        if (emailauthprov.signinformkey.currentState!
                            .validate()) {
                          emailauthprov.signin(context);
                        }
                      },
                      title: 'Login',
                      loading: emailauthprov.signinloading,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: AppColor.primary),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
