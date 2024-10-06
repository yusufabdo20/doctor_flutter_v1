import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/all_pationts/all_pationts_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/empty_widget.dart';
import 'package:doctor_flutter_v1/core/widgets/error_widget.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:doctor_flutter_v1/presentation/auth/otp/view/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllPationtsView extends StatelessWidget {
  const AllPationtsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, PatientModelData>(
      physics: const BouncingScrollPhysics(),
      pagingController: AllPationtsCubit.get(context).pagingController,
      builderDelegate: PagedChildBuilderDelegate<PatientModelData>(
        animateTransitions: true,
        firstPageProgressIndicatorBuilder: (context) => const CustomLoading(),
        newPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
          error:
              AllPationtsCubit.get(context).pagingController.error.toString(),
          onRetry: () {
            AllPationtsCubit.get(context).pagingController.refresh();
          },
        ),
        noItemsFoundIndicatorBuilder: (context) =>
            CustomEmptyWidget(onRetry: () {
          AllPationtsCubit.get(context).getAllPationts();
        }),
        firstPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
          error:
              AllPationtsCubit.get(context).pagingController.error.toString(),
          onRetry: () {
            AllPationtsCubit.get(context).pagingController.refresh();
          },
        ),
        itemBuilder: (context, item, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: ListTile(
              onTap: () {
                context.pushNamed(
                  AppPage.patientDetailsView,
                  arguments: item.id,
                );
              },
              minVerticalPadding: 15.r,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(
                  color: AppColor.blue,
                  width: 2,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.avatar!),
              ),
              subtitle: CustomText(
                  textAlign: TextAlign.start,
                  text: item.email!,
                  style: AppStyle.textStyle12MediumKufram),
              title: CustomText(
                  text: item.name!,
                  textAlign: TextAlign.start,
                  style: AppStyle.textStyle16MediumKufram),
            ),
          );
        },
      ),
    );
  }
}
