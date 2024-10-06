import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/controller/patient_home_layout/patient_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/presentation/doctor_home_layout/data/doctor_home_layout_data.dart';
import 'package:doctor_flutter_v1/presentation/paient_home_layout/data/patient_home_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PatientCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientHomeLayoutCubit, PatientHomeLayoutState>(
      builder: (context, state) {
        return AppBar(
          title: CustomText(
            text: PatientHomeLayoutData
                .titles[PatientHomeLayoutCubit.get(context).selectedIndex],
            style: AppStyle.textStyle20BoldKufram,
            color: AppColor.white,
          ),
          actions: PatientHomeLayoutData.appBarActions(
              context)[PatientHomeLayoutCubit.get(context).selectedIndex],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
