import 'package:doctor_flutter_v1/view/auth/login/widgets/forget_passowd_button.dart';
import 'package:doctor_flutter_v1/view/auth/login/widgets/login_button.dart';
import 'package:doctor_flutter_v1/view/auth/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginForm(),
        // const SizedBox(
        //   height: 10,
        // ),
        // // const ForgetPasswordNavigationButton(),
        // const SizedBox(
        //   height: 10,
        // ),
        // const LoginButton(),
      ],
    );
  }
}
