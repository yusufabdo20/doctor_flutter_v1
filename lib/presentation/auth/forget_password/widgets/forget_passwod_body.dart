import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/forget_password_cubit/forget_password_cubit.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_form_field.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:doctor_flutter_v1/presentation/auth/widgets/logo_with_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 50.r),
      child: Column(
        children: [
          LogoWithTitle(title: AppText.forgetPassword),
          SizedBox(
            height: 50.r,
          ),
          CustomText(
            text: AppText.enterYourEmail,
            style: AppStyle.textStyle18BoldKufram,
            color: AppColor.blue,
          ),
          SizedBox(
            height: 15.r,
          ),
          CustomText(
            text: AppText.a6DigitCodeWillBeSentToYourEmail,
            style: AppStyle.textStyle16MediumKufram,
            color: AppColor.blue,
            maxLines: 10,
          ),
          SizedBox(
            height: 25.r,
          ),
          Form(
            key: ForgetPasswordCubit.get(context).formKey,
            child: CustomTextFormFeild(
              controller: ForgetPasswordCubit.get(context).emailController,
              prefixIcon: Icons.person,
              text: AppText.email,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return context.tr(AppText.pleaseEnterEmail);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 24.r,
          ),
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              if (state is ForgetPasswordLoadingState) {
                return const CustomLoading(
                  size: 100,
                );
              } else {
                return SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: () {
                      ForgetPasswordCubit.get(context)
                          .sendOtpToForgetPassword();
                      // context.pushNamed(
                      //   AppPage.otpScreen,
                      //   arguments: OtpModel(
                      //     email: ForgetPasswordCubit.get(context).emailController.text,
                      //     isForgetPassword: true,
                      //   ),
                      // );
                    },
                    title: AppText.sendOtpToEmail,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
