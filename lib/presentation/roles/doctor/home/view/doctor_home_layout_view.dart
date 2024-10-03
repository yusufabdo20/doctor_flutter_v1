import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home/data/bottom_nav_bar_item.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/home/widgets/custom_bottom_nav_bar.dart';
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
          appBar: AppBar(
            title: CustomText(
              text: "Doctor",
              style: AppStyle.textStyle20BoldKufram,
              color: AppColor.white,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
            ],
          ),
          body: PageView.builder(
              
            
            itemBuilder: (context, index) {
            return Container();
          }),
          bottomNavigationBar: CustomBottomNavBar(),
        ));
  }
}
