part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final UserModelData userModel;

  ProfileSuccessState({required this.userModel});
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;
  ProfileErrorState(this.errorMessage);
}
//SelectCountryState

class SelectCountryState extends ProfileState {
  SelectCountryState();
}
//update profile

class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileState extends ProfileState {
  UserModelData userModelData;
  UpdateProfileState({required this.userModelData});
}

class UpdateProfileErrorState extends ProfileState {
  final String errorMessage;
  UpdateProfileErrorState(this.errorMessage);
}
