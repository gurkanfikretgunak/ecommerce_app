import 'package:flutter/material.dart';

class ColorConstant {
  static final ColorConstant _instance = ColorConstant._init();
  static ColorConstant get instance => _instance;
  ColorConstant._init();

  Color transparent = const Color(0x00000000);
  Color coreBaseBgColor = const Color.fromARGB(220, 255, 142, 104);

  Color drawerBackground = const Color(0xFF2B2E3E);

  Color neutral9 = const Color(0xFFFFFFFF);
  Color neutral1 = Color(0xFF131313);
  Color neutral4 = Color(0xFFF949494);
  Color primary_darker = Color(0xFFFDF5A22);
  Color primary_main = Color(0XFFF16023);
  Color neutral5 = Color(0XFFFD9D9D9);
}
