class Body {
  String? message;
  String? status_color;
  Body({this.message, this.status_color});

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        message: json['message'] as String?,
        status_color: json['status_color'] ?? "red",
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
