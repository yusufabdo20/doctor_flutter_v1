import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_home_layout_state.dart';

class DoctorHomeLayoutCubit extends Cubit<DoctorHomeLayoutState> {
  DoctorHomeLayoutCubit() : super(DoctorHomeLayoutInitial());

  static DoctorHomeLayoutCubit get(BuildContext context) =>
      BlocProvider.of<DoctorHomeLayoutCubit>(context);


}
