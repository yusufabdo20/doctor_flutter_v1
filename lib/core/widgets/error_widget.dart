import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomErrorWidget extends StatelessWidget {
  final String error;
  final void Function() onRetry;

  const CustomErrorWidget(
      {super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_rounded,
          color: AppColor.pinkClr,
          size: 100.r,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          text: error,
          style: AppStyle.textStyle12SemiBoldKufram,
          color: AppColor.pinkClr,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
