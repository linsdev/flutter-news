import 'package:flutter/material.dart';

void errorSnackBar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
  ));
}
