import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/profile/widgets/personal_info.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/profile/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 30.r),
      child: Column(children: [
        ProfileAvatar(
          userModelData: ProfileCubit.get(context).userModel,
        ),
        SizedBox(
          height: 12.r,
        ),
        PersonalInfo(),
        SizedBox(
          height: 12.r,
        ),
        CustomElevatedButton(
          title: AppText.saveChanges,
          onPressed: () {
            ProfileCubit.get(context).updateProfile(context: context);
          },
        ),
        SizedBox(
          height: 12.r,
        ),
        CustomElevatedButton(
          title: AppText.logout,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: AppColor.pinkClr,
          ),
          onPressed: () {
            ProfileCubit.get(context).Logout();
          },
        ),
      ]),
    );
  }
}
