import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/patient/medical_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistoryView extends StatelessWidget {
  final List<MedicalHistoryModel> healthRecordModel;
  const MedicalHistoryView({super.key, required this.healthRecordModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppText.medicalHistory,
            style: AppStyle.textStyle20BoldKufram,
            color: AppColor.white),
      ),
      body: ListView.builder(
        itemCount: healthRecordModel.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(16.r),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: const BorderSide(
                color: AppColor.blue,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(children: [
                ListTile(
                  title: CustomText(
                    text: AppText.diagnosis,
                    textAlign: TextAlign.start,
                    style: AppStyle.textStyle14BoldKufram,
                    maxLines: 100,
                    color: AppColor.blue,
                  ),
                  subtitle: CustomText(
                    text: "${healthRecordModel[index].diagnosis}",
                    style: AppStyle.textStyle16RegularKufram,
                    textAlign: TextAlign.start,
                    maxLines: 100,
                    color: AppColor.blue,
                  ),
                ),
                ListTile(
                  title: CustomText(
                    text: AppText.treatment,
                    textAlign: TextAlign.start,
                    style: AppStyle.textStyle14BoldKufram,
                    maxLines: 100,
                    color: AppColor.blue,
                  ),
                  subtitle: CustomText(
                    text: "${healthRecordModel[index].treatment}",
                    style: AppStyle.textStyle16RegularKufram,
                    textAlign: TextAlign.start,
                    maxLines: 100,
                    color: AppColor.blue,
                  ),
                ),
                ListTile(
                  title: CustomText(
                    text: AppText.notes,
                    textAlign: TextAlign.start,
                    style: AppStyle.textStyle14BoldKufram,
                    maxLines: 100,
                    color: AppColor.blue,
                  ),
                  subtitle: CustomText(
                    text: "${healthRecordModel[index].notes}",
                    style: AppStyle.textStyle16RegularKufram,
                    textAlign: TextAlign.start,
                    maxLines: 100,
                    color: AppColor.blue,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
