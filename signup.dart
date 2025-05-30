import 'package:cui_admission/authentication/signin.dart';
import 'package:cui_admission/statemanagement/auth_prov.dart';
import 'package:cui_admission/utils/app_colors.dart';
import 'package:cui_admission/widgets/button.dart';
import 'package:cui_admission/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                bottomRight: Radius.circular(20),
              ),
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
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_sharp, size: 25),
                        color: Colors.white,
                        iconSize: 50,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Fill up your details to register.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Form(
                key: emailauthprov.signupformkey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: 'Enter Your Name',
                      label: 'Name',
                      controller: emailauthprov.signupname,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter Name';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'ENter Your Email',
                      label: 'Email',
                      controller: emailauthprov.signupemail,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter email address';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'ENter Your Password',
                      label: 'Password',
                      obscustext: true,
                      controller: emailauthprov.signuppassword,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                    ),
                    SizedBox(height: 70),
                    MyButton(
                      loading: emailauthprov.signuploading,
                      ontap: () {
                        if (emailauthprov.signupformkey.currentState!
                            .validate()) {
                          emailauthprov.signup(context);
                        }
                      },
                      title: 'Register',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signin()),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppColor.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
