import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/patient/health_record_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthRecord extends StatelessWidget {
  final List<HealthRecordModel> healthRecordModel;
  const HealthRecord({super.key, required this.healthRecordModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppText.healthRecord,
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
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: const Icon(Icons.monitor_heart),
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomText(
                            text:
                                healthRecordModel[index].heart_rate.toString(),
                            style: AppStyle.textStyle16RegularKufram,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const Icon(Icons.bloodtype_outlined),
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomText(
                            text: healthRecordModel[index].blood_pressure!,
                            style: AppStyle.textStyle16RegularKufram,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const Icon(Icons.thermostat),
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomText(
                            text:
                                healthRecordModel[index].temperature.toString(),
                            style: AppStyle.textStyle16RegularKufram,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: "${healthRecordModel[index].treatment_plan}",
                  style: AppStyle.textStyle16RegularKufram,
                  textAlign: TextAlign.center,
                  maxLines: 100,
                  color: AppColor.blue,
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
