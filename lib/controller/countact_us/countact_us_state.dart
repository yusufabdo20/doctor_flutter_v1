part of 'countact_us_cubit.dart';

@immutable
sealed class CountactUsState {}

final class CountactUsInitial extends CountactUsState {}

final class CountactUsLoadingState extends CountactUsState {}

final class CountactUsSuccessState extends CountactUsState {
  final String contactUsMessage;
  CountactUsSuccessState(this.contactUsMessage);
}

final class CountactUsErrorState extends CountactUsState {
  final String error;
  CountactUsErrorState(this.error);
}
