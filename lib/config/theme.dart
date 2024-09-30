import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        primaryColor: AppColor.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColor.white,
      );

  static ThemeData darkTheme() => ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      );
}
