import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/login_cubit/login_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) {
          return current is LoginLoadingState ||
              current is LoginErrorState ||
              current is LoginSuccessState;
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const CustomLoading(
              size: 100,
            );
          } else {
            return CustomElevatedButton(
              title: AppText.login,
              onPressed: () {
                LoginCubit.get(context).login();
              },
            );
          }
        },
      ),
    );
  }
}
