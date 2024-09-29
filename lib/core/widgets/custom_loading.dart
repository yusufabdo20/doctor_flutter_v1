import 'package:doctor_flutter_v1/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  final double size;
  const CustomLoading({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Lottie.asset(
          AppAnimation.loading,
          repeat: true,
          animate: true,
          height: size.r,
          width: size.r,
        ));
  }
}
