import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/register_cubit/register_cubit_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/view/auth/register/widgets/register_form.dart';
import 'package:doctor_flutter_v1/view/auth/widgets/logo_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 50.r),
      child: Column(
        children: [
          LogoWithTitle(title: AppText.createAccount),
          SizedBox(
            height: 50.r,
          ),
          RegisterForm(),
          SizedBox(
            height: 50.r,
          ),
          BlocBuilder<RegisterCubit, RegisterCubitState>(
              builder: (context, state) {
            if (state is RegisterLoadingState) {
              return CustomLoading();
            } else {
              return SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  title: AppText.createAccount,
                  onPressed: () {
                    RegisterCubit.get(context).register();
                  },
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
