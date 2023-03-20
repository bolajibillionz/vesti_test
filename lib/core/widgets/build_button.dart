import 'package:flutter/material.dart';

import '../size_config.dart';

class GeneralButton extends StatelessWidget {
  GeneralButton({
    required this.onPressed,
    required this.buttonText,
    required this.containerHeight,
    required this.containerWidth,
    required this.borderRadiusSize,
    required this.buttonTextSize,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.borderColor,
    required this.buttonTextFamily,
  });

  final void Function()? onPressed;
  final String buttonText;
  final double containerHeight;
  final double containerWidth;
  final double borderRadiusSize;
  final double buttonTextSize;
  final Color buttonTextColor;
  final Color buttonColor;
  final Color borderColor;
  final String buttonTextFamily;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(containerHeight),
      width: getProportionateScreenWidth(containerWidth),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: getProportionateScreenWidth(buttonTextSize),
              fontFamily: buttonTextFamily),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                side: BorderSide(color: borderColor))),
      ),
    );
  }
}
