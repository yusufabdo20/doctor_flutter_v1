import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/data/doctor_home_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      child: BlocBuilder<DoctorHomeLayoutCubit, DoctorHomeLayoutState>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: DoctorHomeLayoutCubit.get(context).selectedIndex,
              onTap: (index) {
                DoctorHomeLayoutCubit.get(context).changeIndex(index);
              },
              items: DoctorHomeLayoutData.bottomNavBarItems(context));
        },
      ),
    );
  }
}
