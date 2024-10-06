
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthRecordListViewItem extends StatelessWidget {
 final  HealthRecordModelData healthRecordModel;
  const HealthRecordListViewItem({super.key, required this.healthRecordModel});

  @override
  Widget build(BuildContext context) {
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
                                healthRecordModel.heart_rate.toString(),
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
                            text: healthRecordModel.blood_pressure!,
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
                                healthRecordModel.temperature.toString(),
                            style: AppStyle.textStyle16RegularKufram,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: "${healthRecordModel.treatment_plan}",
                  style: AppStyle.textStyle16RegularKufram,
                  textAlign: TextAlign.center,
                  maxLines: 100,
                  color: AppColor.blue,
                ),
              ]),
            ),
          );
       
       
  }
}
