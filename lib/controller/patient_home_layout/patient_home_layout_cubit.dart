import 'package:doctor_flutter_v1/controller/all_pationts/all_pationts_cubit.dart';
import 'package:doctor_flutter_v1/controller/countact_us/countact_us_cubit.dart';
import 'package:doctor_flutter_v1/controller/faqs_cubit/faqs_cubit.dart';
import 'package:doctor_flutter_v1/controller/health_record/health_record_cubit.dart';
import 'package:doctor_flutter_v1/controller/medical_history/medical_history_cubit.dart';
import 'package:doctor_flutter_v1/controller/profile/profile_cubit.dart';
import 'package:doctor_flutter_v1/presentation/contact_us/view/contact_us_view.dart';
import 'package:doctor_flutter_v1/presentation/frequently_asked_questions/view/frequently_asked_questions_mob_tab.dart';
import 'package:doctor_flutter_v1/presentation/all_patients/view/all_pationts_view.dart';
import 'package:doctor_flutter_v1/presentation/health_record_pagination/health_record_pagination.dart';
import 'package:doctor_flutter_v1/presentation/medical_history_pagination/medical_history_pagination.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/view/health_record.dart';
import 'package:doctor_flutter_v1/presentation/profile/view/profile_view.dart';
import 'package:doctor_flutter_v1/repo/all_patient_repo.dart';
import 'package:doctor_flutter_v1/repo/contact_us_repo.dart';
import 'package:doctor_flutter_v1/repo/faqs_repo.dart';
import 'package:doctor_flutter_v1/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_home_layout_state.dart';

class PatientHomeLayoutCubit extends Cubit<PatientHomeLayoutState> {
  PatientHomeLayoutCubit() : super(PatientHomeLayoutInitial());

  static PatientHomeLayoutCubit get(BuildContext context) =>
      BlocProvider.of<PatientHomeLayoutCubit>(context);
  PageController pageController = PageController();
  int selectedIndex = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => HealthRecordCubit()..getAllRecord(),
      child: const HealthRecordPagination(),
    ),
    BlocProvider(
      create: (context) => MedicalHistoryCubit()..getAllRecord(),
      child: const MedicalHistoryPagination(),
    ),
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
  ];
  void changeIndex(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    emit(PatientHomeLayoutChangeIndexState());
  }
}
