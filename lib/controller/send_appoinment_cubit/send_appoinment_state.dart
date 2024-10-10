part of 'send_appoinment_cubit.dart';

sealed class SendAppoinmentState extends Equatable {
  const SendAppoinmentState();

  @override
  List<Object> get props => [];
}

final class SendAppoinmentInitial extends SendAppoinmentState {}

final class SendAppoinmentSuccess extends SendAppoinmentState {
  final AppoinmentModel appoinmentModel;
  const SendAppoinmentSuccess({required this.appoinmentModel});
}

final class SendAppoinmentError extends SendAppoinmentState {
  final String errorMessage;
  const SendAppoinmentError({required this.errorMessage});
}

final class SendAppoinmentLoading extends SendAppoinmentState {}
