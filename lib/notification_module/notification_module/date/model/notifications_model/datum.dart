import 'notification.dart';

class NotificationInfo {
  String? event;
  String? id;
  NotificationInfo({this.event, this.id});

  factory NotificationInfo.fromJson(Map<String, dynamic> json) =>
      NotificationInfo(
        event: json['event'] as String?,
        id: json['data'] as String?,
      );
}

class Datum {
  String? id;
  String? userId;
  String? type;
  NotificationInfo? data;
  Notification? notification;
  String? title;
  String? body;
  int? seen;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Datum({
    this.id,
    this.userId,
    this.type,
    this.data,
    this.notification,
    this.title,
    this.body,
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'].toString(),
        userId: json['user_id'] as String?,
        // type: json['type'] as String?,
        // data: json['data'] == null
        //     ? null
        //     : NotificationInfo.fromJson(json['data'] as Map<String, dynamic>),
        notification: json['notification'] == null
            ? null
            : Notification.fromJson(
                json['notification'] as Map<String, dynamic>),
        title: json['title'] as String?,
        body: json['body'] as String?,
        seen: json['seen'] as int?,
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
        'user_id': userId,
        'type': type,
        'data': data,
        'notification': notification?.toJson(),
        'title': title,
        'body': body,
        'seen': seen,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };
}
