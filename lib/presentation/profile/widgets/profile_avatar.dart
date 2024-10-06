import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/model/user/user_model_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final UserModelData userModelData;
  const ProfileAvatar({
    super.key,
    required this.userModelData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 15.r,
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.blue,
              width: 3.r,
            ),
          ),
          child: CircleAvatar(
            radius: 65.r,
            backgroundColor: AppColor.white,
            backgroundImage: NetworkImage(
              userModelData.avatar!,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: -2.r,
          end: -1.r,
          child: InkWell(
            onTap: () async {
              ProfileCubit.get(context).updateAvatar();
            },
            child: Card(
              shape: const CircleBorder(),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.camera_alt_outlined,
                    color: AppColor.blue, size: 25.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
