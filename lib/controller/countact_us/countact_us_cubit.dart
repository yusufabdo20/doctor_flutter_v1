import 'package:doctor_flutter_v1/repo/contact_us_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countact_us_state.dart';

class CountactUsCubit extends Cubit<CountactUsState> {
  ContactUsRepo contactUsRepo;
  CountactUsCubit({
    required this.contactUsRepo,
  }) : super(CountactUsInitial());

  TextEditingController titleController = TextEditingController();
  //email
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController messageController = TextEditingController();
  //formkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static CountactUsCubit get(BuildContext context) =>
      BlocProvider.of<CountactUsCubit>(context);

  void sendMessage(String userId) async {
    if (formKey.currentState!.validate()) {
      emit(CountactUsLoadingState());
      var result = await contactUsRepo.contactUs(
        title: titleController.text,
        email: emailController.text,
        name: nameController.text,
        message: messageController.text,
        userId: userId,
      );

      result.fold((l) => emit(CountactUsErrorState(l.errorMessage)),
          (r) => emit(CountactUsSuccessState(r)));
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    emailController.dispose();
    nameController.dispose();
    messageController.dispose();
    return super.close();
  }
}
