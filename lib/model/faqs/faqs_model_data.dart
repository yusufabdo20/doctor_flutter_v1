
import 'package:equatable/equatable.dart';

class FaqsModelData extends Equatable {
  String question;
  String answer;
  FaqsModelData({
    required this.question,
    required this.answer,
  });

  factory FaqsModelData.fromJson(Map<String, dynamic> json) => FaqsModelData(
        question: json["question"],
        answer: json["answer"],
      );
  
  @override
  List<Object?> get props => [
        question,
        answer,
  ];
}
