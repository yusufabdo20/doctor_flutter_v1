import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: CustomText(
          text: context.tr(text),
          style: AppStyle.textStyle14RegularKufram,
          color: AppColor.blue,
        ));
  }
}
