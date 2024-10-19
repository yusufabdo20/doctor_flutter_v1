import 'package:doctor_flutter_v1/controller/doctor_home_layout/doctor_home_layout_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/presentation/doctor_home_layout/data/doctor_home_layout_data.dart';
import 'package:doctor_flutter_v1/presentation/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/localization_button.dart';
import '../../../notification_module/notification_module/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
                },
                icon: const Icon(Icons.notifications)),
            LocalizationButton(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MessageScreen()));
                },
                icon: const Icon(Icons.message)),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
