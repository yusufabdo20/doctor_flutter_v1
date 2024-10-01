import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/forget_password_cubit/forget_password_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          showToast(
            context: context,
            text: "${state.message}",
            state: AppColorState.success,
          );
          context.pushReplacementNamed(
            AppPage.otpScreen,
            arguments: OtpModel(
              email: ForgetPasswordCubit.get(context).emailController.text,
              isForgetPassword: true,
            ),
          );
        } else if (state is ForgetPasswordErrorState) {
          showToast(
            context: context,
            text: state.errorMessage,
            state: AppColorState.error,
          );
        }
      },
      child: Scaffold(body: ForgetPasswordBody()),
    );
  }
}

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
