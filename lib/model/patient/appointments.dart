import 'package:equatable/equatable.dart';

class Appointments  extends Equatable{

  int? id;
  int? patientId;
  int? doctorId;
  String? appointmentDate;
  String? status;
  String? notes;
  String? createdAt;
  String? updatedAt;

  Appointments({
    this.id,
    this.patientId,
    this.doctorId,
    this.appointmentDate,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory Appointments.fromJson(Map<String, dynamic> json) {
    return Appointments(
      id: json['id'] as int?,
      patientId: json['patient_id'] as int?,
      doctorId: json['doctor_id'] as int?,
      appointmentDate: json['appointment_date'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  //to Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['doctor_id'] = doctorId;
    data['appointment_date'] = appointmentDate;
    data['status'] = status;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }


  @override
  List<Object?> get props => [
    id,
    patientId,
    doctorId,
    appointmentDate,
    status,
    notes,
    createdAt,
    updatedAt,
  ];
}



