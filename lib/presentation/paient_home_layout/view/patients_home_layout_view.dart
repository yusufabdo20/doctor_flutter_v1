import 'package:doctor_flutter_v1/controller/patient_home_layout/patient_home_layout_cubit.dart';

import 'package:doctor_flutter_v1/presentation/paient_home_layout/widgets/custom_app_bar.dart';
import 'package:doctor_flutter_v1/presentation/paient_home_layout/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomeLayout extends StatelessWidget {
  const PatientHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientHomeLayoutCubit, PatientHomeLayoutState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: const PatientCustomAppBar(),
          body: PageView.builder(
              controller: PatientHomeLayoutCubit.get(context).pageController,
              itemCount: PatientHomeLayoutCubit.get(context).screens.length,
              onPageChanged: (value) {
                PatientHomeLayoutCubit.get(context).changeIndex(value);
              },
              itemBuilder: (context, index) {
                return PatientHomeLayoutCubit.get(context).screens[index];
              }),
          bottomNavigationBar: const PaientCustomBottomNavBar(),
        ));
  }
}
