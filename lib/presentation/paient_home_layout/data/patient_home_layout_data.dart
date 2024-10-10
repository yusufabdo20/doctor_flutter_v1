import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_assets.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

abstract class PatientHomeLayoutData {
  static List<String> titles = [
    AppText.healthRecord,
    AppText.medicalHistory,
    AppText.profile,
    AppText.faqs,
    AppText.communication
  ];
  static List<List<Widget>> appBarActions(BuildContext context) => [
        [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))],
        [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))],
        [
          IconButton(
            onPressed: () {
              context.setLocale(context.locale == const Locale('ar')
                  ? const Locale('en')
                  : const Locale('ar'));
            },
            icon: SvgPicture.asset(
              AppIcon.language,
              colorFilter:
                  const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            ),
          ),
        ],
        [
          IconButton(
            onPressed: () {
              context.setLocale(context.locale == const Locale('ar')
                  ? const Locale('en')
                  : const Locale('ar'));
            },
            icon: SvgPicture.asset(
              AppIcon.language,
              colorFilter:
                  const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            ),
          ),
        ],
        [
          IconButton(
            onPressed: () {
              context.setLocale(context.locale == const Locale('ar')
                  ? const Locale('en')
                  : const Locale('ar'));
            },
            icon: SvgPicture.asset(
              AppIcon.language,
              colorFilter:
                  const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            ),
          ),
        ]
      ];
  static BottomNavigationBarItem customBottomNavBarItem(
      {required String label,
      required String imagePath,
      required BuildContext context}) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        imagePath,
        height: 25.h,
        width: 25.w,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        imagePath,
        height: 25.h,
        width: 25.w,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      label: context.tr(label),
    );
  }

  static List<BottomNavigationBarItem> bottomNavBarItems(
          BuildContext context) =>
      [
        customBottomNavBarItem(
          context: context,
          label: AppText.healthRecord,
          imagePath: AppIcon.logo,
        ),
        customBottomNavBarItem(
          context: context,
          label: AppText.medicalHistory,
          imagePath: AppIcon.logo,
        ),
        customBottomNavBarItem(
          context: context,
          label: AppText.profile,
          imagePath: AppIcon.profile,
        ),
        customBottomNavBarItem(
          context: context,
          label: AppText.faqs,
          imagePath: AppIcon.faqs,
        ),
        customBottomNavBarItem(
          context: context,
          label: AppText.communication,
          imagePath: AppIcon.contactUs,
        ),
      ];
}