import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/data/doctor_home_layout_data.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/widgets/custom_app_bar.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHomeLayout extends StatelessWidget {
  const DoctorHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorHomeLayoutCubit, DoctorHomeLayoutState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: CustomAppBar(),
          body: PageView.builder(
              controller: DoctorHomeLayoutCubit.get(context).pageController,
              itemCount: DoctorHomeLayoutCubit.get(context).screens.length,
              onPageChanged: (value) {
                DoctorHomeLayoutCubit.get(context).changeIndex(value);
              },
              itemBuilder: (context, index) {
                return DoctorHomeLayoutCubit.get(context).screens[index];
              }),
          bottomNavigationBar: CustomBottomNavBar(),
        ));
  }
}
