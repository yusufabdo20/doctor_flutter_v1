import 'package:doctor_flutter_v1/model/medical_history/medical_history_model_data.dart';
import 'package:doctor_flutter_v1/model/meta.dart';

import 'package:equatable/equatable.dart';

class MedicalHistoryModel extends Equatable {
  int? status;
  String? message;
  List<MedicalHistoryModelData>? data;
  Meta? meta;

  MedicalHistoryModel({
    required this.status,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    return MedicalHistoryModel(
      status: json['Status'],
      message: json['message'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<MedicalHistoryModelData>.from(
              json['data'].map((x) => MedicalHistoryModelData.fromJson(x)))
          : null,
    );
  }
  //toJson

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }

    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

  @override
  List<Object?> get props => [status, message, data];
}
