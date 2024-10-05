class UserModelData {
  final int? id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? phone;
  final String? countryCode;
  final String? lang;
  final String? emailVerifiedAt;
  final String? emailVerificationToken;
  final int? status;
  final int? active;
  final String? apiToken;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? role;
  final String? address;
  final String? location;

  UserModelData({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.lang,
    required this.emailVerifiedAt,
    required this.emailVerificationToken,
    required this.status,
    required this.active,
    required this.apiToken,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.address,
    required this.location,
  });

  factory UserModelData.fromJson(Map<String?, dynamic> json) {
    return UserModelData(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      avatar: json['avatar'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      countryCode: json['country_code'] ?? "",
      lang: json['lang'] ?? "",
      emailVerifiedAt: json['email_verified_at'] ?? "",
      emailVerificationToken: json['email_verification_token'] ?? "",
      status: json['status'] ?? 0,
      active: json['active'] ?? 0,
      apiToken: json['api_token'] ?? "",
      deletedAt: json['deleted_at'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      role: json['role'] ?? "",
      address: json['address'] ?? "",
      location: json['location'] ?? "",
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
      'lang': lang,
      'email_verified_at': emailVerifiedAt,
      'email_verification_token': emailVerificationToken,
      'status': status,
      'active': active,
      'api_token': apiToken,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'role': role,
      'address': address,
      'location': location,
    };
  }
}
