import 'package:flutter/material.dart';
import 'package:vesti_test/core/size_config.dart';

class Palette {
  static const Color textFieldColor = Color(0xFFF7FFF3);
  static const Color labelTextColor = Color(0xFF67a948);
  static const Color blackColor = Color(0xFF000000);
  static const Color hintTextColor = Color(0xFF285219);
  static const Color smallButtonBorderColor1 = Color(0xFF3e6f26);
  static const Color smallButtonBorderColor2 = Color(0xFF2E0507);
  static const Color smallButtonBodyColor1 = Color(0xFFFFF5F5);
}

class FontFamily {
  static const String sohne = 'sohne';
  static const String latoRegular = 'Lato-Regular';
}

final hintTextStyle = TextStyle(
  color: Palette.hintTextColor,
  fontFamily: FontFamily.latoRegular,
  fontWeight: FontWeight.w300,
  fontSize: getProportionateScreenWidth(16.0),
);


final labelTextStyle = TextStyle(
  color: Palette.labelTextColor,
  fontFamily: FontFamily.sohne,
  fontWeight: FontWeight.w300,
  fontSize: getProportionateScreenWidth(8.0),
);


