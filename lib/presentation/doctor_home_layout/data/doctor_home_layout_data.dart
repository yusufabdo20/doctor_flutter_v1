import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_assets.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

abstract class DoctorHomeLayoutData {
  static List<String> titles = [
    AppText.AllPaients,
    // AppText.AllDoctors,
    AppText.profile,
    AppText.faqs,
    AppText.communication,
    AppText.appointments,
  ];
  static List<List<Widget>> appBarActions(BuildContext context) => [
        [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
        [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
        [
          IconButton(
            onPressed: () {
              context.setLocale(context.locale == const Locale('ar')
                  ? const Locale('en')
                  : const Locale('ar'));
            },
            icon: SvgPicture.asset(
              AppIcon.language,
              colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
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
              colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
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
              colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
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
        height: 32,
        width: 32,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        imagePath,
        height: 32,
        width: 32,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      label: context.tr(label),
    );
  }

  static List<BottomNavigationBarItem> bottomNavBarItems(
          BuildContext context) =>
      [
        customBottomNavBarItem(
          context: context,
          label: AppText.AllPaients,
          imagePath: AppIcon.allPatients,
        ),
        // customBottomNavBarItem(
        //   context: context,
        //   label: AppText.AllDoctors,
        //   imagePath: AppIcon.allDoctor,
        // ),
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
        customBottomNavBarItem(
          context: context,
          label: AppText.appointments,
          imagePath: AppIcon.calendar,
        ),
      ];
}
