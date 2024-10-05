import 'package:doctor_flutter_v1/model/user/user_model_data.dart';

class LoginModel {
  LoginModel({
    this.token,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      user: UserModelData.fromJson(json['user']),
    );
  }

  String? token;
  UserModelData user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user'] = user.toJson();
    return map;
  }
}
