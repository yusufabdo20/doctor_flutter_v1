import 'dart:developer';

import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/register_cubit/register_cubit_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:doctor_flutter_v1/view/auth/register/widgets/register_body.dart';
import 'package:doctor_flutter_v1/view/auth/widgets/logo_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showToast(
            context: context,
            text: 'register success',
            state: AppColorState.success,
          );
          context.pushNamed(AppPage.otpScreen,
              arguments: OtpModel(
                  email: RegisterCubit.get(context).emailController.text));
        } else if (state is RegisterErrorState) {
          showToast(
            context: context,
            text: state.message,
            state: AppColorState.error,
          );
        }
        // else if (RegisterCubit.get(context).country == null) {
        //   showToast(
        //     context: context,
        //     text: AppText.pleaseEnterCountryCode,
        //     state: AppColorState.warning,
        //   );
        // }
      },
      child: const SafeArea(
        child: Scaffold(body: RegisterBody()),
      ),
    );
  }
}
