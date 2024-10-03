import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/otp_password/otp_password_cubit.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:doctor_flutter_v1/presentation/auth/otp/widgets/custom_pin_put.dart';
import 'package:doctor_flutter_v1/presentation/auth/otp/widgets/otp_timer.dart';
import 'package:doctor_flutter_v1/presentation/auth/widgets/logo_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gen_extension/gen_extension.dart';

class OtpView extends StatelessWidget {
  final OtpModel otpModel;
  const OtpView({super.key, required this.otpModel});

  @override
  Widget build(BuildContext context) {
    OtpPasswordCubit.get(context).email = otpModel.email;
    return BlocListener<OtpPasswordCubit, OtpPasswordState>(
      listener: (context, state) {
        if (state is OtpPasswordSuccessState) {
          showToast(
            context: context,
            text: state.userModel.message,
            state: AppColorState.success,
          );

          CacheService.setData(
            key: AppCacheKey.token,
            value: state.userModel.accessToken,
          );
          if (otpModel.isForgetPassword) {
            context.pushNamedAndRemoveUntil(AppPage.resetPassword,
                predicate: (_) => false);
          } else {
            context.pushNamedAndRemoveUntil(AppPage.doctorHomeLayout,
                predicate: (_) => false);
          }
        } else if (state is OtpPasswordErrorState) {
          showToast(
            context: context,
            text: state.errorMessage,
            state: AppColorState.error,
          );
        } else if (state is ResendOtpSuccessState) {
          showToast(
            context: context,
            text: state.message,
            state: AppColorState.success,
          );
        } else if (state is ResendOtpErrorState) {
          showToast(
            context: context,
            text: state.errorMessage,
            state: AppColorState.error,
          );
        }
      },
      child: Scaffold(
          body: OtpBody(
        otpModel: otpModel,
      )),
    );
  }
}

class OtpBody extends StatelessWidget {
  final OtpModel otpModel;
  const OtpBody({super.key, required this.otpModel});

  @override
  Widget build(BuildContext context) {
    OtpPasswordCubit.get(context).email = otpModel.email;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 50.r),
      child: Column(
        children: [
          LogoWithTitle(title: AppText.otpVerification),
          SizedBox(
            height: 50.r,
          ),
          CustomText(
            text: AppText.aMessageHasBeenSentToYourEmailEnterThe6DigitCode,
            style: AppStyle.textStyle18BoldKufram,
            maxLines: 10,
            color: AppColor.blue,
          ),
          SizedBox(
            height: 15.r,
          ),
          CustomText(
            text: otpModel.email,
            style: AppStyle.textStyle16MediumKufram,
            color: AppColor.blue,
          ),
          SizedBox(
            height: 15.r,
          ),
          CustomPinPut(controller: OtpPasswordCubit.get(context).controller),
          SizedBox(
            height: 15.r,
          ),
          OtpTimer(),
          SizedBox(
            height: 15.r,
          ),
          BlocBuilder<OtpPasswordCubit, OtpPasswordState>(
              builder: (context, state) {
            if (state is OtpPasswordLoadingState) {
              return const CustomLoading();
            } else {
              return SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onPressed: () {
                        OtpPasswordCubit.get(context).submitOtp();
                      },
                      title: AppText.verifyCode));
            }
          })
        ],
      ),
    );
  }
}
