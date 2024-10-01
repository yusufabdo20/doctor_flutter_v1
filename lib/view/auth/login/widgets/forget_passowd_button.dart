import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'package:gen_extension/gen_extension.dart';

class ForgetPasswordNavigationButton extends StatelessWidget {
  const ForgetPasswordNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: CustomTextButton(
        onPressed: () {
          context.pushNamed(AppPage.forgotPasswordScreen);
        },
        text: AppText.forgetPassword,
      ),
    );
  }
}
