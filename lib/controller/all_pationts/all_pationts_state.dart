part of 'all_pationts_cubit.dart';

abstract class AllPationtsState {}

final class AllPationtsInitial extends AllPationtsState {}

//AllPationtsErrorState
final class AllPationtsErrorState extends AllPationtsState {
  final String errorMessage;
  AllPationtsErrorState(this.errorMessage);
}

//AllPationtsSuccessState
final class AllPationtsSuccessState extends AllPationtsState {
  final List<PatientModelData> patients;
  AllPationtsSuccessState(this.patients);
}

//AllPationtsLoadingState
final class AllPationtsLoadingState extends AllPationtsState {
  AllPationtsLoadingState();
}
