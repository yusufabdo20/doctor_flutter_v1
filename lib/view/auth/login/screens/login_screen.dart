import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/login_cubit/login_cubit.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/view/auth/login/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            showToast(
              context: context,
              text: 'login success',
              state: AppColorState.success,
            );

      
            CacheService.setData(
              key: AppCacheKey.token,
              value: state.loginModel.token,
            );
            context.pushReplacementNamed(AppPage.homeScreen);
          } else if (state is LoginErrorState) {
            showToast(
              context: context,
              text: state.message,
              state: AppColorState.error,
            );
          }
        },
        child: const SafeArea(
          child: Scaffold(
            body: LoginBody(),
          ),
        ));
  }
}
