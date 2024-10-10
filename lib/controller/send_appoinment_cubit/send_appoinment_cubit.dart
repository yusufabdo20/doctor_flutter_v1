import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/appoinment_model.dart';
import '../../repo/appoinment_repo.dart';

part 'send_appoinment_state.dart';

class SendAppointmentCubit extends Cubit<SendAppointmentState> {
  SendAppointmentCubit() : super(SendAppoinmentInitial());
  static SendAppointmentCubit get(BuildContext context) =>
      BlocProvider.of<SendAppointmentCubit>(context);
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController treatmentPlanController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AppoinmentRepo _repo = AppoinmentRepoImp();
  sendAppoinment() async {
    emit(SendAppoinmentLoadingState());
    final result = await _repo.sendAppoinment(
      bloodPressure: bloodPressureController.text,
      temperature: double.parse(temperatureController.text),
      heartRate: double.parse(heartRateController.text),
      treatmentPlan: treatmentPlanController.text,
    );

    result.fold((l) {
      emit(SendAppoinmentErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(SendAppoinmentSuccessState(appoinmentModel: r));
    });
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
