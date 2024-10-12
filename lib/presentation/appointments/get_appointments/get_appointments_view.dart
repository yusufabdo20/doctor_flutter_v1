import 'dart:math';

import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/config/routes/app_router.dart';
import 'package:doctor_flutter_v1/controller/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/appoinment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';

import '../../../controller/register_cubit/register_cubit_cubit.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/enums.dart';
import '../widgets/get_appointment_widget.dart';

enum Status { pending, completed, canceled }

class GetAppointmentsView extends StatelessWidget {
  const GetAppointmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: selectdRole == Role.patient
          ? FloatingActionButton(
              backgroundColor: AppColor.blue,
              onPressed: () {
                context.pushNamed(AppPage.sendAppoinmentView);
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
            onRefresh: () {
              return context.read<AppointmentCubit>().getAppointment();
            },
            child: BlocConsumer<AppointmentCubit, AppointmentState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetAppointmentSuccessState) {
                  if (state.appointments.isEmpty) {
                    return CustomText(
                      text: 'No Appointments Found',
                      style: AppStyle.textStyle20BoldKufram,
                    );
                  }
                  return ListView.builder(
                    itemCount: state.appointments.length,
                    itemBuilder: (context, index) {
                      return GetAppointmentWidget(
                        appointmentResponseModel: state.appointments[index],
                      );
                    },
                  );
                }
                if (state is GetAppointmentErrorState) {
                  return CustomText(
                    text: state.errorMessage,
                    style: AppStyle.textStyle20BoldKufram,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
