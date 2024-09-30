import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_flutter_v1/repo/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetPasswordRepo})
      : super(ForgetPasswordInitial());

  ForgetPasswordRepo forgetPasswordRepo;

  static ForgetPasswordCubit get(BuildContext context) =>
      BlocProvider.of<ForgetPasswordCubit>(context);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void sendOtpToForgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      var response =
          await forgetPasswordRepo.forgetPassword(email: emailController.text);

      response.fold((error) {
        emit(ForgetPasswordErrorState(error.errorMessage));
      }, (sucess) {
        emit(ForgetPasswordSuccessState(sucess));
      });
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
