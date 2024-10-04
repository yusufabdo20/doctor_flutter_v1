import 'package:doctor_flutter_v1/config/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/otp_model.dart';
import 'package:doctor_flutter_v1/model/user/user_model_data.dart';
import 'package:doctor_flutter_v1/repo/otp_repo.dart';
import 'package:doctor_flutter_v1/repo/profile_repo.dart';
import 'package:gen_extension/gen_extension.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  late UserModelData userModel;

  static ProfileCubit get(BuildContext context) =>
      BlocProvider.of<ProfileCubit>(context);
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  // Country? country;
  void getProfile() async {
    emit(ProfileLoadingState());
    var response = await profileRepo.getProfile();
    response.fold((error) {
      emit(ProfileErrorState(error.errorMessage));
    }, (data) {
      userModel = data;
      userName.text = data.name ?? "";
      email.text = data.email ?? "";
      phone.text = data.phone ?? "";
      emit(ProfileSuccessState(userModel: data));
    });
  }

  Future<void> updateProfile({required BuildContext context}) async {
    emit(ProfileLoadingState());
    var response = await profileRepo.updateProfile(
        name: userName.text,
        email: email.text,
        phone: phone.text,
        countryCode: " ");
    response.fold((error) {
      emit(ProfileErrorState(error.errorMessage));
    }, (data) {
      getProfile();
    });
  }

  //logout
  Future<void> Logout() async {
    CacheService.remove(key: AppCacheKey.token);

    AppRouter.navigatorKey.currentState!
        .pushNamedAndRemoveUntil(AppPage.loginScreen, (route) => false);
  }

  // Future<void> selectCountry({required Country country}) async {
  //   this.country = country;
  //   emit(SelectCountryState());
  // }

  Future<void> updateAvatar() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      var result = await profileRepo.updateAvatar(image: image);
      result.fold((error) {
        emit(ProfileErrorState(error.errorMessage));
      }, (data) {
        getProfile();
      });
    }
  }
}
