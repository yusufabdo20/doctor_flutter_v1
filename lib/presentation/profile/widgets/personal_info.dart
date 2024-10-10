import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ProfileCubit.get(context).formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFeild(
              text: AppText.userName,
              prefixIcon: Icons.person,
              controller: ProfileCubit.get(context).userName,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.pleaseEnterUserName);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.email,
              prefixIcon: Icons.email,
              controller: ProfileCubit.get(context).email,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.pleaseEnterEmail);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.phone,
              prefixIcon: Icons.phone,
              controller: ProfileCubit.get(context).phone,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.pleaseEnterPhone);
                }
                return null;
              }),
        ],
      ),
    );
  }
}
