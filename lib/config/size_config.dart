import 'package:flutter/material.dart';
import 'package:gen_extension/gen_extension.dart';

enum DeviceType { mobile, tablet, desktop }

abstract class SizeConfig {
  static double maxMobileWidth = 600;
  static double maxTabletWidth = 900;
  static double maxDesktopWidth = 1200;

  static DeviceType getDeviceType(BuildContext context) {
    double deviceWidth = context.deviceHeight;
    if (deviceWidth < maxMobileWidth) {
      return DeviceType.mobile;
    } else if (deviceWidth < maxTabletWidth) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}
