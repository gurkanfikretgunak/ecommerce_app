import 'package:flutter/material.dart';

class ColorConstant {
  static final ColorConstant _instance = ColorConstant._init();
  static ColorConstant get instance => _instance;
  ColorConstant._init();

  Color transparent = const Color(0x00000000);
  Color coreBaseBgColor = const Color.fromARGB(220, 255, 142, 104);
  //* backgrounds
  Color drawerBackground = const Color(0xFF2B2E3E);
}

//example 
// void main(List<String> args) {
//   ColorConstant.instance.coreBaseBgColor;
// }