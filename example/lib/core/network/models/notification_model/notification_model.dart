import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class Notification {
  final String title;
  final String content;
  final String date;

  Notification({
    required this.title,
    required this.content,
    required this.date,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      title: json['title'] ?? 'No title',
      content: json['content'] ?? 'No content',
      date: json['date'] ?? '',
    );
  }
}
