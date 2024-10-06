import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/medical_history/medical_history_model_data.dart';
import 'package:doctor_flutter_v1/repo/medical_history_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'medical_history_state.dart';

class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  MedicalHistoryCubit() : super(MedicalHistoryInitial());

  MedicalHistoryRepo healthRecordRepo = MedicalHistoryRepoImpl();
  static MedicalHistoryCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final PagingController<int, MedicalHistoryModelData> pagingController =
      PagingController(firstPageKey: 1);

  void getAllRecord() async {
    pagingController.addPageRequestListener((pageKey) async {
      await fetchData(pageKey);
    });
  }

  Future<void> fetchData(int pageKey) async {
    final newItems = await healthRecordRepo.getMedicalHistory(
      page: pageKey,
      id: CacheService.getInt(key: AppCacheKey.id).toString(),
    );
    newItems.fold((error) {
      pagingController.error = error.errorMessage;
    }, (sucess) {
      final bool isLastPage =
          sucess.meta!.currentPage! >= sucess.meta!.lastPage!;
      if (isLastPage) {
        pagingController.appendLastPage(sucess.data!);
      } else {
        final nextPageKey = pageKey + 1;

        pagingController.appendPage(sucess.data!, nextPageKey);
      }
    });
  }
}
