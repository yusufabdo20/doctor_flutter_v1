import 'package:doctor_flutter_v1/model/faqs/faqs_model_data.dart';
import 'package:equatable/equatable.dart';

class FaqsModel extends Equatable {
  int status;
  String message;
  List<FaqsModelData> data;
  FaqsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
        status: json["status"],
        message: json["message"],
        data: List<FaqsModelData>.from(
            json["data"].map((x) => FaqsModelData.fromJson(x))),
      );
  
  @override
  List<Object?> get props => [
        status,
        message,
        data,
  ];
}
