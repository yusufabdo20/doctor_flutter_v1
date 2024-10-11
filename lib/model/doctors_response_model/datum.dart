class Doctor {
  int? id;
  String? name;
  String? avatar;
  String? email;
  String? phone;
  String? countryCode;
  String? lang;
  int? status;
  int? active;
  String? address;
  String? location;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Doctor({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.countryCode,
    this.lang,
    this.status,
    this.active,
    this.address,
    this.location,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json['id'] as int?,
        name: json['name'] as String?,
        avatar: json['avatar'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        countryCode: json['country_code'] as String?,
        lang: json['lang'] as String?,
        status: json['status'] as int?,
        active: json['active'] as int?,
        address: json['address'] as String?,
        location: json['location'] as String?,
        role: json['role'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'email': email,
        'phone': phone,
        'country_code': countryCode,
        'lang': lang,
        'status': status,
        'active': active,
        'address': address,
        'location': location,
        'role': role,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };
}
