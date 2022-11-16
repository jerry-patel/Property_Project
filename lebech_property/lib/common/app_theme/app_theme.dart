import 'package:flutter/material.dart';
import 'package:lebech_property/common/constants/app_colors.dart';

ThemeData appThemeData() {
  return ThemeData(
    fontFamily: "Quicksand",

    appBarTheme: const AppBarTheme(
      color: AppColors.blueColor,
      centerTitle: true,
      elevation: 0,
      toolbarTextStyle: TextStyle(color: Colors.white),
      // titleTextStyle: Text
    ),

  );
}