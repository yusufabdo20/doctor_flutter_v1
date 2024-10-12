class Body {
	String? message;

	Body({this.message});

	factory Body.fromJson(Map<String, dynamic> json) => Body(
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
			};
}
