import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/config/routes/app_router.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (CacheService.getString(key: AppCacheKey.token) != null) {
          switch (CacheService.getString(key: AppCacheKey.role)) {
            case "doctor":
              AppRouter.navigatorKey.currentState!.pushNamedAndRemoveUntil(
                  AppPage.doctorHomeLayout, (_) => false);
              break;
            case "patient":
              AppRouter.navigatorKey.currentState!.pushNamedAndRemoveUntil(
                  AppPage.patientHomeLayout, (_) => false);
              break;
            case "family":
              AppRouter.navigatorKey.currentState!.pushNamedAndRemoveUntil(
                  AppPage.familyHomeLayout, (_) => false);
              break;
          }
        } else {
          AppRouter.navigatorKey.currentState!
              .pushReplacementNamed(AppPage.loginScreen);
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
                size: 75,
              ),
            ),
            SizedBox(
              height: 50.r,
            ),
            CustomText(
              text: AppText.appName,
              style: AppStyle.textStyle32BoldKufram,
              color: AppColor.blue,
            ),
          ],
        ),
      ),
    );
  }
}
