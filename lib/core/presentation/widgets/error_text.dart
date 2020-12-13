import 'package:flutter/material.dart';

Widget errorText([String text = '']) {
  if (text.isEmpty) {
    return const SizedBox.shrink();
  }
  return Container(
    padding: const EdgeInsets.only(top: 3),
    constraints: const BoxConstraints.tightFor(width: double.maxFinite),
    child: Text(text, style: const TextStyle(color: Colors.red)),
  );
}
