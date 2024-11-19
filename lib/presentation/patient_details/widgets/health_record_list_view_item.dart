import 'package:doctor_flutter_v1/controller/send_appoinment_cubit/submit_health_record_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/presentation/submit_health_record/select_media.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/localization.dart';
import '../../show_media_screen.dart';

class HealthRecordListViewItem extends StatelessWidget {
  final HealthRecordModelData healthRecordModel;
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.monitor_heart),
                    title: Text(
                      healthRecordModel.heart_rate?.toString() ?? "N/A",
                      style: AppStyle.textStyle16RegularKufram.copyWith(
                        color: AppColor.blue,
                      ),
                      overflow: TextOverflow.ellipsis, // Avoid overflow
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.bloodtype_outlined),
                    title: Text(
                      healthRecordModel.blood_pressure ?? "N/A",
                      style: AppStyle.textStyle16RegularKufram.copyWith(
                        color: AppColor.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.thermostat),
                    title: Text(
                      healthRecordModel.temperature?.toString() ?? "N/A",
                      style: AppStyle.textStyle16RegularKufram.copyWith(
                        color: AppColor.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            // Other rows (use a consistent structure)
            _buildRow(
              label: AppText.walk_plan,
              value: healthRecordModel.walkplan.toString() ?? "N/A",
            ),
            _buildRow(
              label: AppText.notes,
              value: healthRecordModel.notes ?? "N/A",
            ),
            _buildRow(
              label: AppText.bearthRate,
              value: healthRecordModel.breath_rate?.toString() ?? "N/A",
            ),
            _buildRow(
              label: AppText.treatmentPlan,
              value: healthRecordModel.treatment_plan ?? "N/A",
            ),
            _buildRow(
              label: AppText.dateRecorded,
              value: DateFormat('yyyy-MM-dd').format(DateTime.parse(
                  healthRecordModel.created_at ?? DateTime.now().toString())),
            ),
            // Media buttons
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShowMediaScreen(
                          media: healthRecordModel.media ?? [],
                        )));
              },
              child: CustomText(
                text: "Media",
                style: AppStyle.textStyle16RegularKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
            ),
            SizedBox(
              height: 10.r,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectMedia(
                          id: healthRecordModel.id!.toInt(),
                        )));
              },
              child: CustomText(
                text: "uploadmedia",
                style: AppStyle.textStyle16RegularKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRow({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomText(
              text: label,
              style:
                  AppStyle.textStyle14BoldKufram.copyWith(color: AppColor.blue),
            ),
          ),
          SizedBox(width: 10.r),
          Expanded(
            flex: 2,
            child: CustomText(
              text: value,
              style: AppStyle.textStyle16RegularKufram
                  .copyWith(color: AppColor.blue),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
