import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  const Meta({
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      perPage: json['per_page'],
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      total: json['total'],
    );
  }
  //tojson
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    map['total'] = total;
    return map;
  }
  @override
  List<Object?> get props => [
        total,
        perPage,
        currentPage,
        lastPage,
      ];
}



