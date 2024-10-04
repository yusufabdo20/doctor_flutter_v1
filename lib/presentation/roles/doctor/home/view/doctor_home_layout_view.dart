import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/data/doctor_home_layout_data.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home_layout/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorHomeLayout extends StatelessWidget {
  const DoctorHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorHomeLayoutCubit, DoctorHomeLayoutState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: CusomAppBar(),
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

class CusomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CusomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorHomeLayoutCubit, DoctorHomeLayoutState>(
      builder: (context, state) {
        return AppBar(
          title: CustomText(
            text: DoctorHomeLayoutData
                .titles[DoctorHomeLayoutCubit.get(context).selectedIndex],
            style: AppStyle.textStyle20BoldKufram,
            color: AppColor.white,
          ),
          actions: DoctorHomeLayoutData.appBarActions(
              context)[DoctorHomeLayoutCubit.get(context).selectedIndex],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
