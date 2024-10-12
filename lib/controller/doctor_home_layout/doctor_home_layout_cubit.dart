import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/controller/all_pationts/all_pationts_cubit.dart';
import 'package:doctor_flutter_v1/controller/countact_us/countact_us_cubit.dart';
import 'package:doctor_flutter_v1/controller/faqs_cubit/faqs_cubit.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/presentation/contact_us/view/contact_us_view.dart';
import 'package:doctor_flutter_v1/presentation/frequently_asked_questions/view/frequently_asked_questions_mob_tab.dart';
import 'package:doctor_flutter_v1/presentation/all_patients/view/all_pationts_view.dart';
import 'package:doctor_flutter_v1/presentation/profile/view/profile_view.dart';
import 'package:doctor_flutter_v1/repo/all_patient_repo.dart';
import 'package:doctor_flutter_v1/repo/contact_us_repo.dart';
import 'package:doctor_flutter_v1/repo/faqs_repo.dart';
import 'package:doctor_flutter_v1/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/appointments/get_appointments/get_appointments_view.dart';
import '../../repo/appointment_repo.dart';
import '../appointment_cubit/appointment_cubit.dart';

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
      child: const AllPationtsView(),
    ),
    // Container(
    //   color: Colors.blue,
    // ),
    BlocProvider(
      create: (context) => ProfileCubit(
        profileRepo: ProfileRepoImpl(),
      )..getProfile(),
      child: const ProfileView(),
    ),
    BlocProvider(
      create: (context) => FaqsCubit(
        faqsRepo: FaqsRepoImpl(),
      )..getFaqs(),
      child: const FrequentlyAskedQuestions(),
    ),
    BlocProvider(
      create: (context) => CountactUsCubit(
        contactUsRepo: ContactUsRepoImpl(),
      ),
      child: const ContactUsView(),
    ),
    BlocProvider(
      create: (context) =>
          AppointmentCubit(appointmentRepo: AppointmentRepoImp())
            ..getAppointment(),
      child: const GetAppointmentsView(),
    )
  ];
  void changeIndex(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    emit(DoctorHomeLayoutChangeIndexState());
  }
}
