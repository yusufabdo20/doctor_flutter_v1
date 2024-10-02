import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomPinPut({super.key, required this.controller, this.validator});

  static PinTheme pinTheme = PinTheme(
    width: 50.r,
    height: 50.r,
    textStyle: AppStyle.textStyle24RegularCairo,
    decoration: BoxDecoration(
      color: AppColor.blue.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15),
      border: const Border(
        bottom: BorderSide(
          color: AppColor.blue,
          width: 1,
        ),
        left: BorderSide(
          color: AppColor.blue,
          width: 1,
        ),
        right: BorderSide(
          color: AppColor.blue,
          width: 1,
        ),
        top: BorderSide(
          color: AppColor.blue,
          width: 1,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.number,
      focusedPinTheme: pinTheme,
      followingPinTheme: pinTheme,
      submittedPinTheme: pinTheme,
      defaultPinTheme: pinTheme,
      errorPinTheme: pinTheme,
      disabledPinTheme: pinTheme,
    );
  }
}
