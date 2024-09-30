part of 'register_cubit_cubit.dart';

sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class ChangePasswordState extends RegisterCubitState {}

final class ChangeConfirmPasswordState extends RegisterCubitState {}

final class RegisterLoadingState extends RegisterCubitState {}

final class RegisterSuccessState extends RegisterCubitState {
  String message;
  RegisterSuccessState(this.message);
}

final class RegisterErrorState extends RegisterCubitState {
  final String message;
  RegisterErrorState(this.message);
}

final class SelectCountryState extends RegisterCubitState {}
