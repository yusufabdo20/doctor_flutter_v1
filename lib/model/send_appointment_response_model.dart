// class SubmitHealthRecordResponseModel {
//   int? id;
//   int? patientId;
//   int? doctorId;
//   int? familyMemberId;
//   String? bloodPressure;
//   String? heartRate;
//   String? temperature;
//   String? treatmentPlan;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   SubmitHealthRecordResponseModel({
//     this.id,
//     this.patientId,
//     this.doctorId,
//     this.familyMemberId,
//     this.bloodPressure,
//     this.heartRate,
//     this.temperature,
//     this.treatmentPlan,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory SubmitHealthRecordResponseModel.fromJson(Map<String, dynamic> json) {
//     return SubmitHealthRecordResponseModel(
//       id: json['id'] as int?,
//       patientId: json['patient_id'] as int?,
//       doctorId: json['doctor_id'] as int?,
//       familyMemberId: json['family_member_id'] as int?,
//       bloodPressure: json['blood_pressure'] as String?,
//       heartRate: json['heart_rate'] as String?,
//       temperature: json['temperature'] as String?,
//       treatmentPlan: json['treatment_plan'] as String?,
//       createdAt: json['created_at'] == null
//           ? null
//           : DateTime.parse(json['created_at'] as String),
//       updatedAt: json['updated_at'] == null
//           ? null
//           : DateTime.parse(json['updated_at'] as String),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'patient_id': patientId,
//         'doctor_id': doctorId,
//         'family_member_id': familyMemberId,
//         'blood_pressure': bloodPressure,
//         'heart_rate': heartRate,
//         'temperature': temperature,
//         'treatment_plan': treatmentPlan,
//         'created_at': createdAt?.toIso8601String(),
//         'updated_at': updatedAt?.toIso8601String(),
//       };
// }
