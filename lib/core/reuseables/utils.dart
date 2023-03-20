import 'package:flutter/material.dart';

warningSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.brown,
      duration: Duration(seconds: 5),
    ),
  );
}