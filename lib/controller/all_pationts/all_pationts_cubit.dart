import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:doctor_flutter_v1/repo/all_patient_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'all_pationts_state.dart';

class AllPationtsCubit extends Cubit<AllPationtsState> {
  AllPationtsCubit({required this.repo}) : super(AllPationtsInitial());
  final AllPatientRepo repo;
  static AllPationtsCubit get(BuildContext context) => BlocProvider.of(context);

  final PagingController<int, PatientModelData> pagingController =
      PagingController(firstPageKey: 1);

  void getAllPationts() async {
    pagingController.addPageRequestListener((pageKey) async {
      await fetchData(pageKey);
    });
  }

  Future<void> fetchData(int pageKey) async {
    final newItems = await repo.getAllPatient(
      page: pageKey,
    );
    newItems.fold((error) {
      pagingController.error = error.errorMessage;
    }, (sucess) {
      log(sucess.meta!.toJson().toString());
      final bool isLastPage =
          sucess.meta!.currentPage! >= sucess.meta!.lastPage!; //1 < 5
      log(isLastPage.toString());
      if (isLastPage) {
        pagingController.appendLastPage(sucess.data!);
      } else {
        final nextPageKey = pageKey + 1;
        log(isLastPage.toString());

        pagingController.appendPage(sucess.data!, nextPageKey);
      }
    });
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
