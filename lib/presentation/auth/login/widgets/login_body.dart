import 'dart:developer';

import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/main.dart';

import 'package:doctor_flutter_v1/presentation/auth/login/widgets/forget_passowd_button.dart';
import 'package:doctor_flutter_v1/presentation/auth/login/widgets/login_button.dart';
import 'package:doctor_flutter_v1/presentation/auth/login/widgets/login_form.dart';
import 'package:doctor_flutter_v1/presentation/auth/widgets/logo_with_title.dart';
import 'package:doctor_flutter_v1/presentation/auth/widgets/role_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class LoginBody extends StatelessWidget {
  static int isSelected = 0;
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.r, vertical: 50.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWithTitle(
              title: AppText.login,
            ),
            SizedBox(
              height: 30.r,
            ),
            RoleWidget(
              onPressed: (p0) {
                log(p0.toString());
              },
            ),
            SizedBox(
              height: 50.r,
            ),
            const LoginForm(),
            SizedBox(
              height: 10.r,
            ),
            const ForgetPasswordNavigationButton(),
            SizedBox(
              height: 5.r,
            ),
            const LoginButton(),
            SizedBox(
              height: 30.r,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                  text: TextSpan(
                      text: context.tr(AppText.dontHaveAccount) + "  ",
                      style: AppStyle.textStyle16MediumKufram.copyWith(
                        color: AppColor.darkGreyClr,
                      ),
                      children: [
                    TextSpan(
                      text: context.tr(AppText.createAccount),
                      style: AppStyle.textStyle16BoldKufram.copyWith(
                        color: AppColor.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(AppPage.registerScreen);
                        },
                    )
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
