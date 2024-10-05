import 'package:doctor_flutter_v1/model/meta.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';
import 'package:equatable/equatable.dart';

class PatientModel extends Equatable {
  int? Status;
  String? message;
  List<PatientModelData>? data;
  Meta? meta;

  PatientModel({
    required this.Status,
    required this.message,
    required this.meta,
    required this.data,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      Status: json['Status'],
      message: json['message'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<PatientModelData>.from(
              json['data'].map((x) => PatientModelData.fromJson(x)))
          : null,
    );
  }
  //toJson

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = Status;
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
  List<Object?> get props => [Status, message, data];
}
