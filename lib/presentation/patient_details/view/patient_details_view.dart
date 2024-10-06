import 'package:doctor_flutter_v1/controller/patient_details_cubit/patient_details_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/error_widget.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/widgets/patient_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDetailsView extends StatelessWidget {
  final int patientId;
  const PatientDetailsView({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Patient Details',
          style: AppStyle.textStyle20BoldKufram,
          color: AppColor.white,
        ),
      ),
      body: BlocBuilder<PatientDetailsCubit, PatientDetailsState>(
          builder: (context, state) {
        if (state is PatientDetailsLoaded) {
          return PatientDetailsBody(
            patientModelData: state.patientModelData,
          );
        } else if (state is PatientDetailsError) {
          return Center(
            child: CustomErrorWidget(
              error: state.error,
              onRetry: () {
                PatientDetailsCubit.get(context).getPatientDetails(patientId);
              },
            ),
          );
        }
        return const Center(child: CustomLoading());
      }),
    );
  }
}
