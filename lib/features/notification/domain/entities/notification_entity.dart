import 'package:equatable/equatable.dart';

enum NotificationType { profileView, follow, congratulation, event }

class NotificationEntity extends Equatable {
  final String id;
  final NotificationType type;
  final String actorId;
  final String actorName;
  final String actorAvatar;
  final String content;
  final DateTime createdAt;
  final bool isRead;
  final Map<String, dynamic>? actionData;

  const NotificationEntity({
    required this.id,
    required this.type,
    required this.actorId,
    required this.actorName,
    required this.actorAvatar,
    required this.content,
    required this.createdAt,
    this.isRead = false,
    this.actionData,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    actorId,
    actorName,
    actorAvatar,
    content,
    createdAt,
    isRead,
    actionData,
  ];

  NotificationEntity copyWith({
    String? id,
    NotificationType? type,
    String? actorId,
    String? actorName,
    String? actorAvatar,
    String? content,
    DateTime? createdAt,
    bool? isRead,
    Map<String, dynamic>? actionData,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      actorId: actorId ?? this.actorId,
      actorName: actorName ?? this.actorName,
      actorAvatar: actorAvatar ?? this.actorAvatar,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      actionData: actionData ?? this.actionData,
    );
  }
}
