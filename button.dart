import 'package:cui_admission/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String title;
  Function() ontap;
  double? heigt;
  double? widt;
  double? fontsize;
  TextStyle? style;
  Color? color;
  double? radius;
  Widget? child;
  bool loading;
  MyButton(
      {required this.ontap,
      required this.title,
      this.heigt,
      this.widt,
      this.style,
      this.color,
      this.fontsize,
      this.radius,
      this.loading = false,
      this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSplash.splashFactory,
      onTap: ontap,
      child: Container(
        height: heigt ?? 60,
        width: widt ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: style ??
                      TextStyle(
                        fontSize: fontsize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
