import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';
import 'package:geolocator/geolocator.dart';

import '../../controller/health_record/health_record_cubit.dart';
import '../../controller/send_appoinment_cubit/submit_health_record_cubit.dart';
import '../../core/utils/app_style.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_loading.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../paient_home_layout/widgets/custom_app_bar.dart';

class SubmitHealthRecordView extends StatefulWidget {
  SubmitHealthRecordView({super.key});

  @override
  State<SubmitHealthRecordView> createState() => _SubmitHealthRecordViewState();
}

class _SubmitHealthRecordViewState extends State<SubmitHealthRecordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Position? position;

  @override
  void initState() {
    super.initState();
    _determinePosition().then((value) => position = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppText.submitNewRecord,
          style: AppStyle.textStyle20BoldKufram,
          color: AppColor.white,
        ),
      ),
      body: BlocProvider(
        create: (context) => SubmitHealthRecordCubit(),
        child: BlocConsumer<SubmitHealthRecordCubit, SubmitHealthRecordState>(
          listener: (context, state) {
            if (state is SubmitHealthRecordSuccessState) {
              context.pop();
            }
            // if (state is SubmitHealthRecordErrorState) {
            //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //     backgroundColor: Colors.red,
            //     content: Text(state.errorMessage),
            //   ));
            // }
          },
          builder: (context, state) {
            return SafeArea(
              child: Form(
                key: _formKey, // Attach the form key for validation
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    CustomTextFormFeild(
                      text: AppText.bloodPressure,
                      controller: SubmitHealthRecordCubit.get(context)
                          .bloodPressureController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Blood pressure is required';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormFeild(
                      text: AppText.temperature,
                      controller: SubmitHealthRecordCubit.get(context)
                          .temperatureController,
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
                    CustomDatePickerTextField(),
                    CustomTextFormFeild(
                      text: AppText.treatmentPlan,
                      controller: SubmitHealthRecordCubit.get(context)
                          .treatmentPlanController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Treatment plan is required';
                        }
                        return null;
                      },
                    ),
                    if (state is SubmitHealthRecordLoadingState)
                      const Center(
                          child: CustomLoading(
                        size: 100,
                      ))
                    else
                      CustomElevatedButton(
                        // style: ElevatedButton.styleFrom(),
                        title: AppText.send,
                        onPressed: () {
                          // if (SubmitHealthRecordCubit.get(context)
                          //     .validateForm(_formKey)) {
                          SubmitHealthRecordCubit.get(context)
                              .submitHealthRecord(
                            position?.latitude ?? 0.0,
                            position?.longitude ?? 0.0,
                          );
                          HealthRecordCubit.get(context).getAllRecord();

                          SubmitHealthRecordCubit.get(context)
                              .clearControllers();
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         backgroundColor: Colors.red,
                          //         content: Text('Please fill out all fields')),
                          //   );
                          // }
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

class CustomDatePickerTextField extends StatelessWidget {
  const CustomDatePickerTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      text: AppText.heartRate,
      controller: SubmitHealthRecordCubit.get(context).heartRateController,
      keyboardType: TextInputType.number,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Heart rate is required';
      //   }
      //   final heartRate = int.tryParse(value);
      //   if (heartRate == null || heartRate < 20 || heartRate > 300) {
      //     return 'Please enter a valid heart rate';
      //   }
      //   return null;
      // },
    );
  }
}
