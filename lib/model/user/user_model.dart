
import 'package:doctor_flutter_v1/model/user/user_model_data.dart';

class UserModel {
  String accessToken;
  UserModelData data;
  UserModel({
    required this.accessToken,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["token"],
        data: UserModelData.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": data.toJson(),
      };

  UserModel copyWith({
    String? message,
    String? accessToken,
    String? tokenType,
    UserModelData? data,
  }) =>
      UserModel(
        accessToken: accessToken ?? this.accessToken,
        data: data ?? this.data,
      );
  
}
