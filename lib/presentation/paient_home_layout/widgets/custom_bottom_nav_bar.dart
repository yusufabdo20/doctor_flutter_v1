import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/controller/patient_home_layout/patient_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/presentation/doctor_home_layout/data/doctor_home_layout_data.dart';
import 'package:doctor_flutter_v1/presentation/paient_home_layout/data/patient_home_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaientCustomBottomNavBar extends StatelessWidget {
  const PaientCustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      child: BlocBuilder<PatientHomeLayoutCubit, PatientHomeLayoutState>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: PatientHomeLayoutCubit.get(context).selectedIndex,
              onTap: (index) {
                PatientHomeLayoutCubit.get(context).changeIndex(index);
              },
              items: PatientHomeLayoutData.bottomNavBarItems(context));
        },
      ),
    );
  }
}
