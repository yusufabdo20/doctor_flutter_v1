import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/medical_history/medical_history_model_data.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/widgets/medical_history_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistoryView extends StatelessWidget {
  final List<MedicalHistoryModelData> medicalHistoryModel;
  const MedicalHistoryView({super.key, required this.medicalHistoryModel});

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
        itemCount: medicalHistoryModel.length,
        itemBuilder: (context, index) {
          return MedicalHistoryListViewItem(
              medicalHistoryModel: medicalHistoryModel[index]);
        },
      ),
    );
  }
}
