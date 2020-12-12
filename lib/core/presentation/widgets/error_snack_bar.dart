import 'package:flutter/material.dart';

import 'package:news/app/data/models/theme/colors/app_colors.dart';

void errorSnackBar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: AppColors.SnackBarError,
  ));
}
