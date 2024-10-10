import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/error_widget.dart';
import 'package:doctor_flutter_v1/presentation/profile/widgets/personal_info.dart';
import 'package:doctor_flutter_v1/presentation/profile/widgets/profile_avatar.dart';
import 'package:doctor_flutter_v1/presentation/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/enums.dart';
import '../../../core/widgets/custom_banner.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is ProfileSuccessState) {
        // showToast(
        //   context: context,
        //   text: 'changes saved',
        //   state: AppColorState.success,
        // );
      }
    }, builder: (context, state) {
      if (state is ProfileErrorState) {
        return CustomErrorWidget(
            error: state.errorMessage,
            onRetry: () {
              ProfileCubit.get(context).getProfile();
            });
      } else if (state is ProfileSuccessState) {
        return const ProfileBody();
      } else {
        return const Center(child: CustomLoading());
      }
    });
  }
}
