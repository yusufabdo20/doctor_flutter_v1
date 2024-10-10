import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/model/meta.dart';

class HealthRecordModel {
  int status;
  String message;
  List<HealthRecordModelData>? data;
  Meta? meta;

  HealthRecordModel({
    required this.status,
    required this.message,
    this.data,
    this.meta,
  });

  factory HealthRecordModel.fromJson(Map<String, dynamic> json) {
    return HealthRecordModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => HealthRecordModelData.fromJson(e))
              .toList()
          : null,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }
}
