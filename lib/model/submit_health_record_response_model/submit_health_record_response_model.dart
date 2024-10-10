import 'data.dart';

class SubmitHealthRecordResponseModel {
  int? status;
  String message;
  Data? data;

  SubmitHealthRecordResponseModel(
      {this.status, required this.message, this.data});

  factory SubmitHealthRecordResponseModel.fromJson(Map<String, dynamic> json) {
    return SubmitHealthRecordResponseModel(
      status: json['status'] as int?,
      message: json['message'],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
