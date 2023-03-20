import 'package:flutter/material.dart';

import '../size_config.dart';

Text createGeneralText({
  required String inputText,
  required double fontSize,
  required String family,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: TextStyle(
        fontSize: getProportionateScreenWidth(fontSize),
        fontFamily: family,
        // fontWeight: weight,
        color: colorName),
  );
}
