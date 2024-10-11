import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/model/appoinment_model.dart';
import 'package:equatable/equatable.dart';

import '../../repo/appointment_repo.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit({required this.appointmentRepo})
      : super(AppointmentInitial());
  AppointmentRepo appointmentRepo;
  Future<void> getAppointment() async {
    emit(GetAppointmentLoadingState());
    final result = await appointmentRepo.getAppointment();
    result.fold((l) {
      emit(GetAppointmentErrorState(l.errorMessage));
    }, (r) {
      emit(GetAppointmentSuccessState(r));
    });
  }
}
