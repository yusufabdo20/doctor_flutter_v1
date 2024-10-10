part of 'patient_details_cubit.dart';

abstract class PatientDetailsState {}

final class PatientDetailsInitial extends PatientDetailsState {}

final class PatientDetailsLoading extends PatientDetailsState {}

final class PatientDetailsLoaded extends PatientDetailsState {
  final PatientModelData patientModelData;
  PatientDetailsLoaded(this.patientModelData);
}

final class PatientDetailsError extends PatientDetailsState {
  final String error;
  PatientDetailsError(this.error);
}
