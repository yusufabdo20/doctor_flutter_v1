class UserModelData {
  UserModelData({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.countryCode,
    this.lang,
    this.emailVerifiedAt,
    this.userType,
    this.status,
    this.active,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  UserModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    lang = json['lang'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    status = json['status'];
    active = json['active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? avatar;
  String? email;
  String? phone;
  String? countryCode;
  String? lang;
  String? emailVerifiedAt;
  String? userType;
  num? status;
  num? active;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  UserModelData copyWith({
    int? id,
    String? name,
    String? avatar,
    String? email,
    String? phone,
    String? countryCode,
    String? lang,
    String? emailVerifiedAt,
    String? userType,
    dynamic emailVerificationToken,
    num? status,
    num? active,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      UserModelData(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        lang: lang ?? this.lang,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        userType: userType ?? this.userType,
        status: status ?? this.status,
        active: active ?? this.active,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['avatar'] = avatar;
    map['email'] = email;
    map['phone'] = phone;
    map['country_code'] = countryCode;
    map['lang'] = lang;
    map['email_verified_at'] = emailVerifiedAt;
    map['user_type'] = userType;
    map['status'] = status;
    map['active'] = active;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
