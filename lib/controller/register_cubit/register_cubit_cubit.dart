import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/repo/sign_up.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this._repo) : super(RegisterCubitInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final RegisterRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  bool isPassword = true;
  bool isConfirmPassword = true;

  // change password state
  void changePasswordState() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  // change password state
  void changeConfirmPasswordState() {
    isConfirmPassword = !isConfirmPassword;
    emit(ChangeConfirmPasswordState());
  }

  Future<void> register({required BuildContext context}) async {
 
    if (formKeyRegister.currentState!.validate()) {
      emit(RegisterLoadingState());
      final response = await _repo.registerUser(
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
        phone: phoneController.text,
        countryCode: " ",
      );
      response.fold((error) {
        emit(RegisterErrorState(error.errorMessage));
      }, (data) {
        emit(RegisterSuccessState(data.toString()));
      });
    }
  }

  // Future<void> selectCountry({required Country country}) async {
  //   this.country = country;
  //   emit(SelectCountryState());
  // }

  // void showWarningSelectCountry({required BuildContext context}) {
  //   if (RegisterCubit.get(context).country == null) {
  //     showToast(
  //       context: context,
  //       text: 'please select country',
  //       state: AppColorState.warning,
  //     );
  //   }

    @override
    Future<void> close() {
      emailController.dispose();
      passwordController.dispose();
      userNameController.dispose();
      phoneController.dispose();
      return super.close();
    }
  }

