import 'package:doctor_flutter_v1/model/media_model.dart';
import 'package:equatable/equatable.dart';

class HealthRecordModelData extends Equatable {
  num? id;
  num? patient_id;
  num? doctor_id;
  num? family_member_id;
  String? blood_pressure;
  num? heart_rate;
  String? temperature;
  String? treatment_plan;
  String? created_at;
  String? updated_at;
  List<MediaModel> media;

  HealthRecordModelData({
    required this.id,
    required this.patient_id,
    required this.doctor_id,
    required this.family_member_id,
    required this.blood_pressure,
    required this.heart_rate,
    required this.temperature,
    required this.treatment_plan,
    required this.created_at,
    required this.updated_at,
    required this.media,
  });

  factory HealthRecordModelData.fromJson(Map<String?, dynamic> json) {
    return HealthRecordModelData(
      id: json['id'] ?? 0,
      patient_id: json['patient_id'] ?? 0,
      doctor_id: json['doctor_id'] ?? 0,
      family_member_id: json['family_member_id'] ?? 0,
      blood_pressure: json['blood_pressure'] ?? '',
      heart_rate: json['heart_rate'] ?? 0,
      temperature: json['temperature'] ?? '',
      treatment_plan: json['treatment_plan'] ?? '',
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
      media: json['media'] != null
          ? (json['media'] as List).map((i) => MediaModel.fromJson(i)).toList()
          : [],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patient_id;
    data['doctor_id'] = doctor_id;
    data['family_member_id'] = family_member_id;
    data['blood_pressure'] = blood_pressure;
    data['heart_rate'] = heart_rate;
    data['temperature'] = temperature;
    data['treatment_plan'] = treatment_plan;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        patient_id,
        doctor_id,
        family_member_id,
        blood_pressure,
        heart_rate,
        temperature,
        treatment_plan,
        created_at,
        updated_at
      ];
}
