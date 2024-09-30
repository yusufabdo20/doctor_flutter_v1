part of 'otp_password_cubit.dart';

abstract class OtpPasswordState {}

final class OtpPasswordInitial extends OtpPasswordState {}

//OtpPasswordLoadingState
final class OtpPasswordLoadingState extends OtpPasswordState {}

//OtpPasswordErrorState
final class OtpPasswordErrorState extends OtpPasswordState {
  final String errorMessage;
  OtpPasswordErrorState(this.errorMessage);
}

//OtpPasswordSuccessState
final class OtpPasswordSuccessState extends OtpPasswordState {
  final UserModel userModel;
  OtpPasswordSuccessState(this.userModel);
}
//resendOtpSucessState
final class ResendOtpSuccessState extends OtpPasswordState {
  final String message;
  ResendOtpSuccessState(this.message);
}
final class ResendOtpErrorState extends OtpPasswordState {
  final String errorMessage;
  ResendOtpErrorState(this.errorMessage);
}