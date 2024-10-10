class AppoinmentModel {
  int? id;
  int? patientId;
  int? doctorId;
  String? appointmentDate;
  String? status;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  AppoinmentModel({
    this.id,
    this.patientId,
    this.doctorId,
    this.appointmentDate,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory AppoinmentModel.fromJson(Map<String, dynamic> json) {
    return AppoinmentModel(
      id: json['id'] as int?,
      patientId: json['patient_id'] as int?,
      doctorId: json['doctor_id'] as int?,
      appointmentDate: json['appointment_date'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
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
