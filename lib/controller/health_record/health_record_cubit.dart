import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/health_record/health_Record_model.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/repo/health_record_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'health_record_state.dart';

class HealthRecordCubit extends Cubit<HealthRecordState> {
  HealthRecordCubit() : super(HealthRecordInitial());
  HealthRecordRepo healthRecordRepo = HealthRecordRepoImpl();
  static HealthRecordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final PagingController<int, HealthRecordModelData> pagingController =
      PagingController(firstPageKey: 1);

  void getAllRecord() async {
    pagingController.addPageRequestListener((pageKey) async {
      await fetchData(pageKey);
    });
  }

  Future<void> fetchData(int pageKey) async {
    final newItems = await healthRecordRepo.getHealthRecords(
      page: pageKey,
      id: CacheService.getInt(key: AppCacheKey.id).toString(),
    );
    newItems.fold((error) {
      pagingController.error = error.errorMessage;
    }, (sucess) {
      final bool isLastPage =
          sucess.meta!.currentPage! >= sucess.meta!.lastPage!; //1 < 5
      if (isLastPage) {
        pagingController.appendLastPage(sucess.data!);
      } else {
        final nextPageKey = pageKey + 1;

        pagingController.appendPage(sucess.data!, nextPageKey);
      }
    });
  }
}
