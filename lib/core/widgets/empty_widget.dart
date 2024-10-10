import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyWidget extends StatelessWidget {
  final void Function() onRetry;
  const CustomEmptyWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_rounded,
          color: AppColor.blue,
          size: 100.r,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomText(
          text: AppText.dataNotFound,
          style: AppStyle.textStyle18BoldKufram,
          color: AppColor.blue,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
