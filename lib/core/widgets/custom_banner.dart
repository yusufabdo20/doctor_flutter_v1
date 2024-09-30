import 'package:another_flushbar/flushbar.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showToast(
    {BuildContext? context,
    required AppColorState state,
    ToastGravity? gravity = ToastGravity.TOP,
    required String text}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      backgroundColor: AppColor.getColorState(state: state),
      textColor: Colors.white,
      fontSize: 16.0.r);
}

void showFlushBar(
    {required BuildContext context,
    required AppColorState state,
    required String text}) {
  Flushbar(
    message: text.tr().toString(),
    backgroundColor: AppColor.getColorState(state: state),
    duration: const Duration(seconds: 5),
    flushbarPosition: FlushbarPosition.BOTTOM,
    margin: EdgeInsets.all(30.r),
    borderRadius: BorderRadius.circular(8.r),
    mainButton: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    ),
    dismissDirection: FlushbarDismissDirection.VERTICAL,
    messageSize: 24.r,
    forwardAnimationCurve: Curves.linear,
    reverseAnimationCurve: Curves.linear,
    barBlur: 5,
    textDirection: Directionality.of(context),
    backgroundGradient: const LinearGradient(
        colors: [AppColor.blue, AppColor.white]),
    boxShadows: const [
      BoxShadow(
        color: AppColor.blue,
        blurRadius: 3.0,
      )
    ],
  ).show(context);
}
