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
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.tall,
              prefixIcon: Icons.height,
              controller: ProfileCubit.get(context).tall,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.thisFieldIsRequired);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.birthDay,
              prefixIcon: Icons.date_range,
              controller: ProfileCubit.get(context).birth_date,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.thisFieldIsRequired);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.blod_type,
              prefixIcon: Icons.bloodtype,
              controller: ProfileCubit.get(context).bloodType,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.thisFieldIsRequired);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.walk_plan,
              prefixIcon: Icons.assist_walker,
              controller: ProfileCubit.get(context).walk_plan,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.thisFieldIsRequired);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.weight,
              prefixIcon: Icons.boy_outlined,
              controller: ProfileCubit.get(context).weight,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.thisFieldIsRequired);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.bmi,
              prefixIcon: Icons.boy_rounded,
              controller: ProfileCubit.get(context).bmi,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.thisFieldIsRequired);
                }
                return null;
              }),
        ],
      ),
    );
  }
}
