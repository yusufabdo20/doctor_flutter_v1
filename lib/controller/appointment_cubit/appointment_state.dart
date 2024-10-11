part of 'appointment_cubit.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {}

final class GetAppointmentLoadingState extends AppointmentState {}

final class GetAppointmentSuccessState extends AppointmentState {
  final List<AppointmentResponseModel> appointments;
  const GetAppointmentSuccessState(this.appointments);
  @override
  List<Object> get props => [appointments];
}

final class GetAppointmentErrorState extends AppointmentState {
  final String errorMessage;
  const GetAppointmentErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class SubmitAppointmentLoadingState extends AppointmentState {}

final class SubmitAppointmentSuccessState extends AppointmentState {
  final AppointmentResponseModel appointment;
  const SubmitAppointmentSuccessState(this.appointment);
  @override
  List<Object> get props => [appointment];
}

final class SubmitAppointmentErrorState extends AppointmentState {
  final String errorMessage;
  const SubmitAppointmentErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class GetDoctorsLoadingState extends AppointmentState {}

final class GetDoctorsSuccessState extends AppointmentState {
  final DoctorsResponseModel doctorsResponseModel;
  const GetDoctorsSuccessState(this.doctorsResponseModel);
  @override
  List<Object> get props => [doctorsResponseModel];
}

final class GetDoctorsErrorState extends AppointmentState {
  final String errorMessage;
  const GetDoctorsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
