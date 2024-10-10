import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_style.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../paient_home_layout/widgets/custom_app_bar.dart';

class SendAppointmentView extends StatelessWidget {
  const SendAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppText.sendAppoinment,
          style: AppStyle.textStyle20BoldKufram,
          color: AppColor.white,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextFormFeild(
              text: AppText.bloodPressure,
            ),
            CustomTextFormFeild(
              text: AppText.temperature,
            ),
            CustomTextFormFeild(
              text: AppText.heartRate,
            ),
            CustomTextFormFeild(
              text: AppText.treatmentPlan,
            ),
          ],
        ),
      )),
    );
  }
}
