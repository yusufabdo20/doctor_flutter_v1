part of 'submit_health_record_cubit.dart';

sealed class SubmitHealthRecordState extends Equatable {
  const SubmitHealthRecordState();

  @override
  List<Object> get props => [];
}

final class SubmitHealthRecordInitial extends SubmitHealthRecordState {}

final class SubmitHealthRecordSuccessState extends SubmitHealthRecordState {
  final SubmitHealthRecordResponseModel submitHealthRecordResponseModel;
  const SubmitHealthRecordSuccessState(
      {required this.submitHealthRecordResponseModel});
}

final class SubmitHealthRecordErrorState extends SubmitHealthRecordState {
  final String errorMessage;
  const SubmitHealthRecordErrorState({required this.errorMessage});
}

final class SubmitHealthRecordLoadingState extends SubmitHealthRecordState {}
