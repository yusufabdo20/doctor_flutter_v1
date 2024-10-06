import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPatientData extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const CustomPatientData({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        bottom: 12.r,
      ),
      trailing: Icon(
        icon,
        size: 20.r,
        color: AppColor.blue,
      ),
      title: CustomText(
        textAlign: TextAlign.start,
        text: title,
        color: AppColor.blue,
        style: AppStyle.textStyle18BoldKufram,
      ),
      subtitle: CustomText(
        textAlign: TextAlign.start,
        text: subtitle,
        style: AppStyle.textStyle16BoldKufram,
      ),
    );
  }
}
