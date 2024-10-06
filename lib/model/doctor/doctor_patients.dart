import 'package:doctor_flutter_v1/model/doctor/doctor_data_model.dart';
import 'package:equatable/equatable.dart';

class DoctorPatients extends Equatable {
  int? id;
  int? doctor_id;
  int? patient_id;
  String? created_at;
  String? updated_at;
  DoctorDataModel? doctorData;

  DoctorPatients({
    this.id,
    this.doctor_id,
    this.patient_id,
    this.created_at,
    this.updated_at,
    this.doctorData,
  });

  factory DoctorPatients.fromJson(Map<String, dynamic> json) => DoctorPatients(
        id: json["id"]??0,
        doctor_id: json["doctor_id"]??0,
        patient_id: json["patient_id"]??0,
        created_at: json["created_at"]??"" ,
        updated_at: json["updated_at"]??"",
        doctorData: DoctorDataModel.fromJson(json["doctor"]),
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, doctor_id, patient_id, created_at, updated_at, doctorData];
}
