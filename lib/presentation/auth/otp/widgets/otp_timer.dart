import 'dart:async';

import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/otp_password/otp_password_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int seconds = 50;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      replacement: CustomTextButton(
        onPressed: () {
          OtpPasswordCubit.get(context).resendOtp();
          setState(() {
            isVisible = true;
            Timer.periodic(const Duration(seconds: 1), (timer) {
              if (seconds == 0) {
                isVisible = false;
                seconds = 50;
                timer.cancel();
              } else {
                seconds--;
              }
              setState(() {});
            });
          });
        },
        text: AppText.resend,
      ),
      child: CustomText(
          text: "00:$seconds",
          style: AppStyle.textStyle24BoldCairo,
          color: AppColor.blue),
    );
  }
}
