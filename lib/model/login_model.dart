
import 'package:doctor_flutter_v1/model/user/user_model_data.dart';

class LoginModel {
  LoginModel({
    this.token,
    this.message,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      message: json['message'],
      user: UserModelData.fromJson(json['user']),
    );
  }

  String? token;
  String? message;
  UserModelData user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = token;
    map['user'] = user.toJson();
    return map;
  }
}
