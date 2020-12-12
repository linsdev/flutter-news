import 'package:flutter/material.dart';

import 'package:news/app/data/models/theme/colors/app_colors.dart';

Widget errorText([String text = '']) {
  if (text.isEmpty) {
    return SizedBox.shrink();
  }
  return Container(
    padding: EdgeInsets.only(top: 3),
    constraints: BoxConstraints.tightFor(width: double.maxFinite),
    child: Text(text, style: TextStyle(color: AppColors.TextError)),
  );
}
