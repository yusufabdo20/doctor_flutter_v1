import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/send_appoinment_cubit/send_appoinment_cubit.dart';
import '../../core/utils/app_style.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../paient_home_layout/widgets/custom_app_bar.dart';

class SendAppointmentView extends StatelessWidget {
  SendAppointmentView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendAppointmentCubit(),
      child: BlocBuilder<SendAppointmentCubit, void>(
        builder: (context, state) {
          return Form(
            key: _formKey, // Attach the form key for validation
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                CustomTextFormFeild(
                  text: AppText.bloodPressure,
                  controller:
                      SendAppointmentCubit.get(context).bloodPressureController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Blood pressure is required';
                    }
                    return null;
                  },
                ),
                CustomTextFormFeild(
                  text: AppText.temperature,
                  controller:
                      SendAppointmentCubit.get(context).temperatureController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Temperature is required';
                    }
                    final temp = double.tryParse(value);
                    if (temp == null || temp < 20 || temp > 70) {
                      return 'Please enter a valid temperature';
                    }
                    return null;
                  },
                ),
                CustomTextFormFeild(
                  text: AppText.heartRate,
                  controller:
                      SendAppointmentCubit.get(context).heartRateController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Heart rate is required';
                    }
                    final heartRate = int.tryParse(value);
                    if (heartRate == null ||
                        heartRate < 20 ||
                        heartRate > 300) {
                      return 'Please enter a valid heart rate';
                    }
                    return null;
                  },
                ),
                CustomTextFormFeild(
                  text: AppText.treatmentPlan,
                  controller:
                      SendAppointmentCubit.get(context).treatmentPlanController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Treatment plan is required';
                    }
                    return null;
                  },
                ),
                CustomElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  title: AppText.send,
                  onPressed: () {
                    if (SendAppointmentCubit.get(context)
                        .validateForm(_formKey)) {
                      SendAppointmentCubit.get(context).sendAppoinment();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form is valid!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill out all fields')),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
