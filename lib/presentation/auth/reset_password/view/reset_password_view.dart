import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_form_field.dart';
import 'package:doctor_flutter_v1/repo/profile_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pushNamedAndRemoveUntil(AppPage.doctorHomeLayout,
                predicate: (_) => false);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsetsDirectional.all(24),
        padding: const EdgeInsetsDirectional.all(24),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.r,
                ),
                CustomTextFormFeild(
                    text: AppText.password,
                    prefixIcon: Icons.person,
                    controller: passwordController,
                    isPassword: true,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return context.tr(AppText.pleaseEnterPassword);
                      }
                      return null;
                    }),
                SizedBox(
                  height: 24.r,
                ),
                CustomTextFormFeild(
                    text: AppText.confirmPassword,
                    prefixIcon: Icons.person,
                    isPassword: true,
                    validator: (p0) {
                      if (passwordController.text != p0) {
                        return context.tr(AppText.passwordNotMatch);
                      }
                      if (p0 == null || p0.isEmpty) {
                        return context.tr(AppText.pleaseEnterPassword);
                      }
                      return null;
                    }),
                SizedBox(
                  height: 24.r,
                ),
                CustomElevatedButton(
                    title: AppText.resetPassword,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ProfileRepoImpl().getProfile().then((value) {
                          value.fold((e) {}, (date) {
                            DioHelper.putData(
                                token: CacheService.getString(
                                    key: AppCacheKey.token),
                                url: EndPoint.updateProfile,
                                data: {
                                  "name": date.name,
                                  "email": date.email,
                                  "phone": date.phone,
                                  "country_code": date.countryCode,
                                  "lang": "en",
                                  "password": passwordController.text
                                }).then((value) {
                              showToast(
                                  context: context,
                                  state: AppColorState.success,
                                  text: AppText.ressetPasswordSuccess);
                              context.pushReplacementNamed(
                                  AppPage.doctorHomeLayout);
                            });
                          });
                        });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
