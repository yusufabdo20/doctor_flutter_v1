
import 'package:doctor_flutter_v1/presentation/roles/doctor/home/data/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r)),
      child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
          items: BottomNavBarItemData.bottomNavBarItems(context)),
    );
  }
}
