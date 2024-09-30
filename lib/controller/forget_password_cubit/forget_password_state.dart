part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoadingState extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {
  final String? message;

  ForgetPasswordSuccessState(this.message);
}

final class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordErrorState(this.errorMessage);
}
