import 'dart:developer';

import 'package:doctor_flutter_v1/config/localization.dart';

import 'package:doctor_flutter_v1/view/auth/login/widgets/forget_passowd_button.dart';
import 'package:doctor_flutter_v1/view/auth/login/widgets/login_button.dart';
import 'package:doctor_flutter_v1/view/auth/login/widgets/login_form.dart';
import 'package:doctor_flutter_v1/view/auth/widgets/logo_with_title.dart';
import 'package:doctor_flutter_v1/view/auth/widgets/role_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height: 15.r,
            ),
            RoleWidget(
              onPressed: (p0) {
                log(p0.toString());
              },
            ),
            SizedBox(
              height: 15.r,
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
          ],
        ),
      ),
    );
  }
}
