import 'package:cui_admission/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  String? initialval;
  String? label;
  Key? keyvalue;
  bool? obscustext;
  TextEditingController? controller;
  FormFieldValidator? validate;
  ValueChanged<String>? onchange;
  // Double? padding;

  CustomTextField(
      {this.controller,
      this.label,
      required this.hintText,
      this.validate,
      this.keyvalue,
      this.onchange,
      this.obscustext = false,
      this.initialval
      // this.padding,
      });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialval,
      validator: validate,
      key: keyvalue,
      onChanged: onchange,
      keyboardType: TextInputType.text,
      obscureText: obscustext!,
      // style: TextStyle(color: Colors.white),

      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 18, 20, 14),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        label: Text(
          label ?? '',
          style: TextStyle(color: AppColor.primary),
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(185, 185, 185, 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 45, 134, 134),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primary,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
