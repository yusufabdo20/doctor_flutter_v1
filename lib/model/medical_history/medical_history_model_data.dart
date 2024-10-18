import 'package:doctor_flutter_v1/model/media_model.dart';
import 'package:equatable/equatable.dart';

class MedicalHistoryModelData extends Equatable {
  num? id;
  num? patient_id;
  String? diagnosis;
  String? treatment;
  String? created_at;
  String? notes;
  String? date_recorded;
  List<MediaModel> media;
  MedicalHistoryModelData({
    required this.id,
    required this.patient_id,
    required this.diagnosis,
    required this.treatment,
    required this.created_at,
    required this.notes,
    required this.date_recorded,
    required this.media,
  });

  factory MedicalHistoryModelData.fromJson(Map<String?, dynamic> json) {
    return MedicalHistoryModelData(
      id: json['id'] ?? 0,
      patient_id: json['patient_id'] ?? 0,
      diagnosis: json['diagnosis'] ?? '',
      treatment: json['treatment'] ?? '',
      created_at: json['created_at'] ?? '',
      notes: json['notes'] ?? '',
      date_recorded: json['date_recorded'] ?? '',
      media: json['media'] != null
          ? (json['media'] as List).map((i) => MediaModel.fromJson(i)).toList()
          : [],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patient_id;
    data['diagnosis'] = diagnosis;
    data['treatment'] = treatment;
    data['created_at'] = created_at;
    data['notes'] = notes;
    data['date_recorded'] = date_recorded;
    return data;
  }

  @override
  List<Object?> get props =>
      [id, patient_id, diagnosis, treatment, created_at, notes, date_recorded];
}
