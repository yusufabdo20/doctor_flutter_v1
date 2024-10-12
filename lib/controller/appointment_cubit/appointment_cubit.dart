import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/model/appoinment_model.dart';
import 'package:doctor_flutter_v1/model/doctors_response_model/datum.dart';
import 'package:doctor_flutter_v1/model/doctors_response_model/doctors_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/enums.dart';
import '../../core/widgets/custom_banner.dart';
import '../../repo/appointment_repo.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit({required this.appointmentRepo})
      : super(AppointmentInitial());
  static AppointmentCubit get(BuildContext context) =>
      BlocProvider.of<AppointmentCubit>(context);
  AppointmentRepo appointmentRepo;
  final TextEditingController appointmentDateController =
      TextEditingController();
  final TextEditingController notesController = TextEditingController();
  late DoctorsResponseModel doctorsResponseModel;
  String? doctorId;
  List<Doctor> doctors = [];

  Future<void> getAppointment() async {
    emit(GetAppointmentLoadingState());
    final result = await appointmentRepo.getAppointment();
    result.fold((l) {
      emit(GetAppointmentErrorState(l.errorMessage));
    }, (r) {
      emit(GetAppointmentSuccessState(r));
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  submitAppointment() async {
    emit(SubmitAppointmentLoadingState());
    final result = await appointmentRepo.submitAppointment(
      appointmentDate: appointmentDateController.text,
      doctorId: doctorId ?? "0",
      notes: notesController.text,
    );

    result.fold((l) {
      showToast(state: AppColorState.error, text: l.errorMessage);
      emit(SubmitAppointmentErrorState(l.errorMessage));
    }, (r) {
      showToast(state: AppColorState.success, text: "Submit Success");
      log(r.notes.toString());

      emit(SubmitAppointmentSuccessState(r));
    });
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  getDoctors() async {
    emit(GetDoctorsLoadingState());
    final result = await appointmentRepo.getDoctors();
    result.fold((l) {
      emit(GetDoctorsErrorState(l.errorMessage));
    }, (r) {
      doctorsResponseModel = r;
      doctors = r.doctors ?? [];
      emit(GetDoctorsSuccessState(r));
    });
  }
}
