import 'package:doctor_flutter_v1/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final double size;
  final double opacity;
  const Logo({super.key, this.size = 100, this.opacity = 1});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SvgPicture.asset(
        AppImage.logo,
        fit: BoxFit.contain,
        width: size.r,
        height: size.r,
      ),
    );
  }
}
