import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message, required bool isSuccess}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: isSuccess ? Colors.black : Colors.black,
      ),
    ),
    backgroundColor: isSuccess ? Colors.greenAccent : Colors.red[500],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
