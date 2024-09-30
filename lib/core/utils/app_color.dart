import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color blue = Colors.blue;
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFFF6F61);
  static const Color greenClr = Colors.green;
  static const Color white = Colors.white;
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
  static const Color green = Color(0xff2CB667);
  //ECE1FB
  static const Color darkGreenClr = Color(0xff055533);
  static const Color whiteClr = Color(0xffFFFFFF);
  static const Color grayClr = Color(0xff677E74);
  //F5F5DC
  static const Color lightYellowClr = Color(0xffF5F5DC);

  static getColorState({required AppColorState state}) {
    switch (state) {
      case AppColorState.warning:
        return yellowClr;
      case AppColorState.success:
        return greenClr;
      case AppColorState.error:
        return pinkClr;
      case AppColorState.normal:
        return blue;
    }
  }
}
