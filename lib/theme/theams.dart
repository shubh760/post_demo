import 'package:flutter/material.dart';
import 'package:mock_app_post/cosnt/color_const.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: colors.tileColor,
  primaryColor: colors.blackColor
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: colors.textColor
);