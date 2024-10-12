part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

class GetNotificationEvent extends NotificationEvent {
  bool? seen;
  String? from;
  String? to;
  int? page;
  GetNotificationEvent({this.seen, this.from, this.to, this.page = 1});

  Map<String, dynamic> toJson() => {
        // 'seen': 1,
        'from': DateTime.now()
            .subtract(const Duration(days: 10000))
            .toIso8601String()
            .split('T')[0],
        'to': DateTime.now().toIso8601String().split('T')[0],
        'page': page,
        'per_page': '100',
      };
}

class NotificationSeenEvent extends NotificationEvent {
  final String id;
  NotificationSeenEvent({required this.id});
}
