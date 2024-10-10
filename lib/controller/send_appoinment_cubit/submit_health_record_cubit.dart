import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/enums.dart';
import '../../model/appoinment_model.dart';
import '../../model/send_appointment_response_model.dart';
import '../../model/submit_health_record_response_model/submit_health_record_response_model.dart';
import '../../repo/submit_health_record_repo.dart';

part 'submit_health_record_state.dart';

class SubmitHealthRecordCubit extends Cubit<SubmitHealthRecordState> {
  SubmitHealthRecordCubit() : super(SubmitHealthRecordInitial());
  static SubmitHealthRecordCubit get(BuildContext context) =>
      BlocProvider.of<SubmitHealthRecordCubit>(context);
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController treatmentPlanController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SubmitHealthRecordRepo _repo = SubmitHealthRecordRepoImp();
  submitHealthRecord() async {
    emit(SubmitHealthRecordLoadingState());
    final result = await _repo.submitHealthRecord(
      bloodPressure: bloodPressureController.text,
      temperature: double.parse(temperatureController.text),
      heartRate: double.parse(heartRateController.text),
      treatmentPlan: treatmentPlanController.text,
    );

    result.fold((l) {
      showToast(state: AppColorState.error, text: l.errorMessage);
      emit(SubmitHealthRecordErrorState(errorMessage: l.errorMessage));
    }, (r) {
      showToast(state: AppColorState.success, text: r.message);
      log(r.message.toString());
      emit(SubmitHealthRecordSuccessState(submitHealthRecordResponseModel: r));
    });
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  void clearControllers() {
    bloodPressureController.clear();
    temperatureController.clear();
    heartRateController.clear();
    treatmentPlanController.clear();
  }
}
