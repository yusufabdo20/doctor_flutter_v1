import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/cache/app_cache_key.dart';
import '../services/cache/cache_service.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';

class LocalizationButton extends StatelessWidget {
  const LocalizationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.setLocale(context.locale == const Locale('ar')
            ? const Locale('en')
            : const Locale('ar'));
        CacheService.setData(
          key: AppCacheKey.lang,
          value: context.locale.languageCode.toString(),
        );
        // CacheHelper.saveData(key: 'lang', value: context.locale.toString());
      },
      icon: SvgPicture.asset(
        AppIcon.language,
        colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
      ),
    );
  }
}
