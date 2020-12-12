import 'package:flutter/material.dart';

import 'package:news/app/data/models/theme/colors/app_colors.dart';

Widget orSeparator() {
  return Column(
    children: [
      SizedBox(height: 8),
      Container(
        height: 10,
        child: VerticalDivider(color: AppColors.VerticalDivider),
      ),
      SizedBox(height: 5),
      Text('OR', style: TextStyle(color: AppColors.VerticalDivider)),
      SizedBox(height: 5),
      Container(
        height: 10,
        child: VerticalDivider(color: AppColors.VerticalDivider),
      ),
      SizedBox(height: 8),
    ],
  );
}
