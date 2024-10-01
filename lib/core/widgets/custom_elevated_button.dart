import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final ButtonStyle? style;

  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: context.theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            // fixedSize: Size.fromWidth(100.r),
          ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 10.r),
        child: Text(context.tr(title),
            style: AppStyle.textStyle16BoldKufram.copyWith(
              color: Colors.white,
            )),
      ),
    );
  }
}
