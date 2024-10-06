import 'package:equatable/equatable.dart';

class DoctorDataModel extends Equatable {
  int? id;
  String? name;
  String? avatar;
  String? email;
  String? phone;
  String? country_code;
  String? lang;
  String? email_verified_at;
  String? email_verification_token;
  int? status;
  int? active;
  String? api_token;
  String? deleted_at;
  String? created_at;
  String? updated_at;
  String? role;
  String? address;
  String? location;

  DoctorDataModel({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.country_code,
    this.lang,
    this.email_verified_at,
    this.email_verification_token,
    this.status,
    this.active,
    this.api_token,
    this.deleted_at,
    this.created_at,
    this.updated_at,
    this.role,
    this.address,
    this.location,
  });

  DoctorDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    avatar = json['avatar'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    country_code = json['country_code'] ?? '';
    lang = json['lang'] ?? '';
    email_verified_at = json['email_verified_at'] ?? '';
    email_verification_token = json['email_verification_token'] ?? '';
    status = json['status'] ?? 0;
    active = json['active'] ?? 0;
    api_token = json['api_token'] ?? '';
    deleted_at = json['deleted_at'] ?? '';
    created_at = json['created_at'] ?? '';
    updated_at = json['updated_at'] ?? '';
    role = json['role'] ?? '';
    address = json['address'] ?? '';
    location = json['location'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['email'] = email;
    data['phone'] = phone;
    data['country_code'] = country_code;
    data['lang'] = lang;
    data['email_verified_at'] = email_verified_at;
    data['email_verification_token'] = email_verification_token;
    data['status'] = status;
    data['active'] = active;
    data['api_token'] = api_token;
    data['deleted_at'] = deleted_at;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['role'] = role;
    data['address'] = address;
    data['location'] = location;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
        email,
        phone,
        country_code,
        lang,
        email_verified_at,
        email_verification_token,
        status,
        active,
        api_token,
        deleted_at,
        created_at,
        updated_at,
        role,
        address,
        location,
      ];
}
