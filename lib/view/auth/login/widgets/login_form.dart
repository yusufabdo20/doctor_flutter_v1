import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/login_cubit/login_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            controller: LoginCubit.get(context).emailController,
            prefixIcon: Icons.person,
            text: AppText.email,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return context.tr(AppText.pleaseEnterEmail);
              }
              return null;
            },
          ),
          SizedBox(
            height: 24.r,
          ),
          CustomTextFormFeild(
            prefixIcon: Icons.lock,
            controller: LoginCubit.get(context).passwordController,
            text: AppText.password,
            isPassword: true,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return context.tr(AppText.pleaseEnterPassword);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
