import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
      primaryColor: AppColor.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.blue,
        iconTheme: IconThemeData(color: Colors.white),
        
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: AppColor.blue,
        type: BottomNavigationBarType.fixed,
      ));

  static ThemeData darkTheme() => ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      );
}
