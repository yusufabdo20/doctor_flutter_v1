import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_flutter_v1/model/user/user_model.dart';
import 'package:doctor_flutter_v1/repo/otp_repo.dart';

part 'otp_password_state.dart';

class OtpPasswordCubit extends Cubit<OtpPasswordState> {
  OtpPasswordCubit({required this.otpRepo}) : super(OtpPasswordInitial());

  OtpRepo otpRepo;
  String email = "";

  static OtpPasswordCubit get(BuildContext context) =>
      BlocProvider.of<OtpPasswordCubit>(context);
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitOtp() async {
    if (formKey.currentState!.validate()) {
      emit(OtpPasswordLoadingState());
      final response =
          await otpRepo.verifyOtp(otp: controller.text, email: email);
      response.fold((error) {
        emit(OtpPasswordErrorState(error.errorMessage));
      }, (data) {
        emit(OtpPasswordSuccessState(data));
      });
    }
  }

  void resendOtp() async {
    final response = await otpRepo.resendOtp(email: email);
    response.fold((error) {
      emit(ResendOtpErrorState(error.errorMessage));
    }, (data) {
      emit(ResendOtpSuccessState(data));
    });
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
