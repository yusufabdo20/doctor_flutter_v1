import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/appoinment_model.dart';

part 'send_appoinment_state.dart';

class SendAppoinmentCubit extends Cubit<SendAppoinmentState> {
  SendAppoinmentCubit() : super(SendAppoinmentInitial());
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController treatmentPlanController = TextEditingController();
  sendAppoinment() {}
}
