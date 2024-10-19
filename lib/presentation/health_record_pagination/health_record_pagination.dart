import 'package:doctor_flutter_v1/config/size_config.dart';
import 'package:doctor_flutter_v1/controller/health_record/health_record_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/empty_widget.dart';
import 'package:doctor_flutter_v1/core/widgets/error_widget.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/widgets/health_record_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:gen_extension/gen_extension.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../config/routes/app_page.dart';

class HealthRecordPagination extends StatelessWidget {
  const HealthRecordPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          HealthRecordCubit.get(context).pagingController.refresh();
        },
        child: PagedListView<int, HealthRecordModelData>(
          physics: const BouncingScrollPhysics(),
          pagingController: HealthRecordCubit.get(context).pagingController,
          builderDelegate: PagedChildBuilderDelegate<HealthRecordModelData>(
            animateTransitions: true,
            firstPageProgressIndicatorBuilder: (context) =>
                const CustomLoading(),
            newPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
              error: HealthRecordCubit.get(context)
                  .pagingController
                  .error
                  .toString(),
              onRetry: () {
                HealthRecordCubit.get(context).pagingController.refresh();
              },
            ),
            noItemsFoundIndicatorBuilder: (context) =>
                CustomEmptyWidget(onRetry: () {
              HealthRecordCubit.get(context).getAllRecord();
            }),
            firstPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
              error: HealthRecordCubit.get(context)
                  .pagingController
                  .error
                  .toString(),
              onRetry: () {
                HealthRecordCubit.get(context).pagingController.refresh();
              },
            ),
            itemBuilder: (context, item, index) {
              return HealthRecordListViewItem(healthRecordModel: item);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.blue,
        onPressed: () {
          context.pushNamed(
            AppPage.submitHealthRecordView,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
