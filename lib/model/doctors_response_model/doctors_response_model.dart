import 'datum.dart';
import 'meta.dart';

class DoctorsResponseModel {
  int? status;
  String? message;
  List<Doctor>? doctors;
  Meta? meta;

  DoctorsResponseModel({this.status, this.message, this.doctors, this.meta});

  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) {
    return DoctorsResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      doctors: (json['data'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': doctors?.map((e) => e.toJson()).toList(),
        'meta': meta?.toJson(),
      };
}
