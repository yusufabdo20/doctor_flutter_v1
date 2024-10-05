import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/controller/all_pationts/all_pationts_cubit.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/all_patients/view/all_pationts_view.dart';
import 'package:doctor_flutter_v1/presentation/roles/doctor/profile/view/profile_view.dart';
import 'package:doctor_flutter_v1/repo/all_patient_repo.dart';
import 'package:doctor_flutter_v1/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_home_layout_state.dart';

class DoctorHomeLayoutCubit extends Cubit<DoctorHomeLayoutState> {
  DoctorHomeLayoutCubit() : super(DoctorHomeLayoutInitial());

  static DoctorHomeLayoutCubit get(BuildContext context) =>
      BlocProvider.of<DoctorHomeLayoutCubit>(context);
  PageController pageController = PageController();
  int selectedIndex = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => AllPationtsCubit(
        repo: AllPatientRepoImpl(),
      )..getAllPationts(),
      child: AllPationtsView(),
    ),
    Container(
      color: Colors.blue,
    ),
    BlocProvider(
      create: (context) => ProfileCubit(
        profileRepo: ProfileRepoImpl(),
      )..getProfile(),
      child: ProfileView(),
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  void changeIndex(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    emit(DoctorHomeLayoutChangeIndexState());
  }
}
