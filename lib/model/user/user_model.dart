
import 'package:doctor_flutter_v1/model/user/user_model_data.dart';

class UserModel {
  String message;
  String accessToken;
  String tokenType;
  UserModelData data;
  UserModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: UserModelData.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
        "user": data.toJson(),
      };

  UserModel copyWith({
    String? message,
    String? accessToken,
    String? tokenType,
    UserModelData? data,
  }) =>
      UserModel(
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        data: data ?? this.data,
      );
  
}
