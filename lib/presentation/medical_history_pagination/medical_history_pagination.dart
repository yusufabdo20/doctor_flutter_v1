import 'package:doctor_flutter_v1/controller/medical_history/medical_history_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/empty_widget.dart';
import 'package:doctor_flutter_v1/core/widgets/error_widget.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/model/medical_history/medical_history_model_data.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/widgets/medical_history_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MedicalHistoryPagination extends StatelessWidget {
  const MedicalHistoryPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, MedicalHistoryModelData>(
      physics: const BouncingScrollPhysics(),
      pagingController: MedicalHistoryCubit.get(context).pagingController,
      builderDelegate: PagedChildBuilderDelegate<MedicalHistoryModelData>(
        animateTransitions: true,
        firstPageProgressIndicatorBuilder: (context) => const CustomLoading(),
        newPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
          error: MedicalHistoryCubit.get(context)
              .pagingController
              .error
              .toString(),
          onRetry: () {
            MedicalHistoryCubit.get(context).pagingController.refresh();
          },
        ),
        noItemsFoundIndicatorBuilder: (context) =>
            CustomEmptyWidget(onRetry: () {
          MedicalHistoryCubit.get(context).getAllRecord();
        }),
        firstPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
          error: MedicalHistoryCubit.get(context)
              .pagingController
              .error
              .toString(),
          onRetry: () {
            MedicalHistoryCubit.get(context).pagingController.refresh();
          },
        ),
        itemBuilder: (context, item, index) {
          return MedicalHistoryListViewItem(
            medicalHistoryModel: item,
          );
        },
      ),
    );
  }
}
