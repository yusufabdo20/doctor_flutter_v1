import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (CacheService.getString(key: AppCacheKey.token) != null) {
          context.pushReplacementNamed(AppPage.homeScreen);
        } else {
          context.pushReplacementNamed(AppPage.loginScreen);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: Logo(
                size: 200,
              ),
            ),
            SizedBox(
              height: 20.r,
            ),
            CustomText(
              text: "العباقرة",
              style: AppStyle.textStyle48BoldKufram,
              color: AppColor.darkPurple,
            ),
          ],
        ),
      ),
    );
  }
}
