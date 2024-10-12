import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/appointment_cubit/appointment_cubit.dart';
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
            AppointmentCubit(appointmentRepo: AppointmentRepoImp())
              ..getDoctors(),
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
                    const DoctorNamesDropDown(),
                    CustomTextFormFeild(
                      readOnly: true,
                      prefixIcon: Icons.calendar_month,
                      onTap: () async {
                        // Show date picker dialog
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              DateTime.now(), // Set the initial date to today
                          firstDate: DateTime(
                              2000), // Set the first date for the picker
                          lastDate: DateTime(
                              2101), // Set the last date for the picker
                        );

                        // If a date is picked, format it and update the controller
                        if (pickedDate != null) {
                          // Format the picked date (e.g., 'yyyy-MM-dd')
                          String formattedDate =
                              "${pickedDate.toLocal()}".split(' ')[
                                  0]; // Adjust this to your preferred format
                          AppointmentCubit.get(context)
                              .appointmentDateController
                              .text = formattedDate;
                        }
                      },
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
                    CustomTextFormFeild(
                      text: AppText.notes,
                      controller: AppointmentCubit.get(context).notesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Notes is required';
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
                            AppointmentCubit.get(context).submitAppointment();
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
