import 'package:flutter/material.dart';

Widget errorText([String text = '']) {
  if (text.isEmpty) {
    return SizedBox.shrink();
  }
  return Container(
    padding: EdgeInsets.only(top: 3),
    constraints: BoxConstraints.tightFor(width: double.maxFinite),
    child: Text(text, style: TextStyle(color: Colors.red)),
  );
}
