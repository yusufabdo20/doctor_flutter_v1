import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';

import '../../../core/services/cache/app_cache_key.dart';
import '../../../core/services/cache/cache_service.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../widgets/get_appointment_widget.dart';

enum Status { pending, completed, canceled }

class GetAppointmentsView extends StatelessWidget {
  const GetAppointmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          CacheService.getString(key: AppCacheKey.role) == 'patient'
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
