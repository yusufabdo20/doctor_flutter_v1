import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/appoinment_model.dart';

part 'send_appoinment_state.dart';

class SendAppoinmentCubit extends Cubit<SendAppoinmentState> {
  SendAppoinmentCubit() : super(SendAppoinmentInitial());
}
