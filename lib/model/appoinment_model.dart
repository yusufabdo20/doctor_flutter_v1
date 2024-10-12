class AppointmentResponseModel {
  var id;
  var patientId;
  var doctorId;
  String? appointmentDate;
  String? status;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  AppointmentResponseModel({
    this.id,
    this.patientId,
    this.doctorId,
    this.appointmentDate,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory AppointmentResponseModel.fromJson(Map<String, dynamic> json) {
    return AppointmentResponseModel(
      id: json['id'],
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      appointmentDate: json['appointment_date'],
      status: json['status'],
      notes: json['notes'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'patient_id': patientId,
        'doctor_id': doctorId,
        'appointment_date': appointmentDate,
        'status': status,
        'notes': notes,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
