import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_assets.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoWithTitle extends StatelessWidget {
  final double? logoSize;
  final String title;
  const LogoWithTitle({
    super.key,
    this.logoSize,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Logo(
        size: logoSize ?? 35.r,
      ),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomText(
          textAlign: TextAlign.start,
          text: title,
          style: AppStyle.textStyle22BoldKufram,
          color: AppColor.blue,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          context.setLocale(context.locale == const Locale('ar')
              ? const Locale('en')
              : const Locale('ar'));
        },
        icon: SvgPicture.asset(
          AppIcon.language,
          colorFilter: ColorFilter.mode(AppColor.blue, BlendMode.srcIn),
        ),
      ),
    );
  }
}
