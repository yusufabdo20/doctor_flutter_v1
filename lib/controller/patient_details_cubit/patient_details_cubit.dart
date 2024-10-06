import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:doctor_flutter_v1/repo/patient_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'patient_details_state.dart';

class PatientDetailsCubit extends Cubit<PatientDetailsState> {
  PatientDetailsCubit({required this.patientDetailsRepo})
      : super(PatientDetailsInitial());
  PatientDetailsRepo patientDetailsRepo;
  static PatientDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  void getPatientDetails(int id) {
    emit(PatientDetailsLoading());
    patientDetailsRepo.getPatientDetails(id: id).then((value) {
      value.fold((l) {
        emit(PatientDetailsError(
          l.errorMessage,
        ));
      }, (r) {
        emit(PatientDetailsLoaded(r));
      });
    });
  }
}
