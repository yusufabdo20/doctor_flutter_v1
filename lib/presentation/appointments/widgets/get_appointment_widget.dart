import 'package:doctor_flutter_v1/model/appoinment_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/widgets/custom_text.dart';
import '../get_appointments/get_appointments_view.dart';

class GetAppointmentWidget extends StatelessWidget {
  const GetAppointmentWidget(
      {super.key, required this.appointmentResponseModel});
  final AppointmentResponseModel appointmentResponseModel;
  getStatus(String status) {
    switch (status) {
      case "pending":
        return Status.pending;
      case "completed":
        return Status.completed;
      case "canceled":
        return Status.canceled;
    }
  }

  getStatusColor(Status status) {
    switch (status) {
      case Status.pending:
        return AppColor.yellowClr;
      case Status.completed:
        return AppColor.greenClr;
      case Status.canceled:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColor.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.blue, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        trailing: Container(
          height: double.infinity,
          // width: double.,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getStatusColor(
                getStatus(appointmentResponseModel.status ?? "")),
          ),
          child: CustomText(
            text: appointmentResponseModel.status ?? "",
            style: AppStyle.textStyle14BoldKufram,
            maxLines: 1,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        subtitle: CustomText(
            style: AppStyle.textStyle12MediumKufram,
            maxLines: 1,
            color: AppColor.blue,
            textAlign: TextAlign.start,
            text: appointmentResponseModel.appointmentDate ?? ""),
        title: CustomText(
          style: AppStyle.textStyle14BoldKufram,
          // color: Colo,
          maxLines: 10,
          textAlign: TextAlign.start,
          text: appointmentResponseModel.notes ?? "No Notes Found",
        ),
      ),
    );
  }
}
