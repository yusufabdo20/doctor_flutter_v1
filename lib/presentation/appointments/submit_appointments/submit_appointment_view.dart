import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';

import '../../../core/utils/app_style.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../repo/appointment_repo.dart';
import '../widgets/doctors_drop_down.dart';

class SubmitAppointmentView extends StatelessWidget {
  SubmitAppointmentView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppText.submitAppointment,
          style: AppStyle.textStyle20BoldKufram,
          color: AppColor.white,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            AppointmentCubit(appointmentRepo: AppointmentRepoImp()),
        child: BlocConsumer<AppointmentCubit, AppointmentState>(
          listener: (context, state) {
            if (state is SubmitAppointmentSuccessState) {
              context.pop();
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Form(
                key: _formKey, // Attach the form key for validation
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    // const DoctorNamesDropDown(),
                    CustomTextFormFeild(
                      text: AppText.appointmentDate,
                      controller: AppointmentCubit.get(context)
                          .appointmentDateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Appointment Date is required';
                        }
                        return null;
                      },
                    ),
                    if (state is SubmitAppointmentLoadingState)
                      const Center(
                        child: CustomLoading(
                          size: 100,
                        ),
                      )
                    else
                      CustomElevatedButton(
                        // style: ElevatedButton.styleFrom(),
                        title: AppText.send,
                        onPressed: () {
                          if (AppointmentCubit.get(context)
                              .validateForm(_formKey)) {
                            AppointmentCubit.get(context)
                                .submitAppointment(doctorId: '1');
                            // HealthRecordCubit.get(context).getAllRecord();

                            // AppointmentCubit.get(context).clearControllers();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Please fill out all fields')),
                            );
                          }
                        },
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
