import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/register_cubit/register_cubit_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKeyRegister,
      child: Column(
        children: [
          CustomTextFormFeild(
              text: AppText.userName,
              prefixIcon: Icons.person,
              controller: RegisterCubit.get(context).userNameController,
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
              controller: RegisterCubit.get(context).emailController,
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
              keyboardType: TextInputType.phone,
              controller: RegisterCubit.get(context).phoneController,
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
              text: AppText.password,
              prefixIcon: Icons.person,
              controller: RegisterCubit.get(context).passwordController,
              isPassword: true,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.pleaseEnterPassword);
                }
                return null;
              }),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
              text: AppText.confirmPassword,
              prefixIcon: Icons.person,
              isPassword: true,
              validator: (p0) {
                if (RegisterCubit.get(context).passwordController.text != p0) {
                  return context.tr(AppText.passwordNotMatch);
                }
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.pleaseEnterPassword);
                }
                return null;
              }),
        ],
      ),
    );
  }
}
