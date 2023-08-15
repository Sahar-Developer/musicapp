import 'package:flutter/material.dart';

class AppColor {
//dark theme color

  static var dwhiteColor = const Color.fromARGB(255, 168, 173, 176);
  static var dslideColor = Color.fromARGB(255, 143, 77, 193);
  static var dbuttonColor = Color.fromARGB(255, 122, 74, 199);
  static var dbuttonnColor = Color.fromARGB(255, 112, 73, 202);
  static var dbgColor = Color.fromARGB(255, 80, 59, 203);
  static var dbgDarkColor = Color.fromARGB(255, 51, 41, 166);
  static var dgradient =
      LinearGradient(colors: [AppColor.dbgDarkColor, AppColor.dbuttonColor]);

//light theme color

  static var lwhiteColor = Color.fromARGB(255, 11, 103, 86);
  static var lslideColor = Color.fromARGB(255, 243, 249, 167);
  static var lbuttonColor = Color.fromARGB(255, 255, 192, 203);
  static var lbuttonnColor = Color.fromARGB(255, 255, 104, 62);
  static var lbgColor = Color.fromARGB(255, 125, 181, 255);
  static var lbgDarkColor = Color.fromARGB(255, 101, 201, 255);
  static var lgradient =
      LinearGradient(colors: [AppColor.lbgColor, AppColor.lslideColor]);
}
