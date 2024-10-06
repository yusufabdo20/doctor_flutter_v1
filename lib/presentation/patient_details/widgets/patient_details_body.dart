import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/view/health_record.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/view/medical_history_view.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/widgets/custom_patient_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_extension/gen_extension.dart';

class PatientDetailsBody extends StatelessWidget {
  final PatientModelData patientModelData;
  const PatientDetailsBody({
    super.key,
    required this.patientModelData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 50.r),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.blue,
                width: 3.r,
              ),
            ),
            child: CircleAvatar(
              radius: 65.r,
              backgroundColor: AppColor.white,
              backgroundImage: NetworkImage(
                patientModelData.avatar!,
              ),
            ),
          ),
          SizedBox(
            height: 12.r,
          ),
          CustomPatientData(
            icon: Icons.person,
            title: AppText.name,
            subtitle: patientModelData.name!,
          ),
          CustomPatientData(
            icon: Icons.email,
            title: AppText.email,
            subtitle: patientModelData.email!,
          ),
          CustomPatientData(
            icon: Icons.phone,
            title: AppText.phone,
            subtitle: patientModelData.phone!,
          ),
          CustomPatientData(
            icon: Icons.location_on,
            title: AppText.address,
            subtitle: patientModelData.address!,
          ),
          CustomPatientData(
            icon: Icons.location_city,
            title: AppText.location,
            subtitle: patientModelData.location!,
          ),
          Row(children: [
            CustomElevatedButton(
                onPressed: () {
                  context.push(HealthRecord(
                    healthRecordModel: patientModelData.healthRecord!,
                  ));
                },
                title: AppText.healthRecord),
            SizedBox(
              width: 10.r,
            ),
            CustomElevatedButton(
                onPressed: () {
                  context.push(
                    MedicalHistoryView(
                      healthRecordModel: patientModelData.medicalHistory!,
                    ),
                  );
                },
                title: AppText.medicalHistory),
          ])
        ],
      ),
    );
  }
}
