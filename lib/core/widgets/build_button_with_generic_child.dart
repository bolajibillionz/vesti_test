import 'package:flutter/material.dart';

import '../size_config.dart';

class ButtonWithChild extends StatelessWidget {
  ButtonWithChild({
    required this.onPressed,
    required this.child,
    required this.containerHeight,
    required this.containerWidth,
    required this.borderRadiusSize,
    required this.buttonColor,
    required this.borderColor,
  });

  final void Function()? onPressed;
  final Widget child;
  final double containerHeight;
  final double containerWidth;
  final double borderRadiusSize;
  final Color buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(containerHeight),
      width: getProportionateScreenWidth(containerWidth),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                side: BorderSide(color: borderColor))),
        child: child,
      ),
    );
  }
}
