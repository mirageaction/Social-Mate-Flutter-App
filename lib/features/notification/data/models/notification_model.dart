import 'package:social_mate_app/features/notification/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.type,
    required super.actorId,
    required super.actorName,
    required super.actorAvatar,
    required super.content,
    required super.createdAt,
    super.isRead,
    super.actionData,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: _parseNotificationType(json['type'] as String),
      actorId: json['actor_id'] as String,
      actorName: json['users']['name'] as String? ?? '',
      actorAvatar: json['users']['avatar_url'] as String? ?? '',
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
      actionData: json['action_data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': _notificationTypeToString(type),
      'actor_id': actorId,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'is_read': isRead,
      'action_data': actionData,
    };
  }

  static NotificationType _parseNotificationType(String type) {
    switch (type) {
      case 'profile_view':
        return NotificationType.profileView;
      case 'follow':
        return NotificationType.follow;
      case 'congratulation':
        return NotificationType.congratulation;
      case 'event':
        return NotificationType.event;
      default:
        return NotificationType.profileView;
    }
  }

  static String _notificationTypeToString(NotificationType type) {
    switch (type) {
      case NotificationType.profileView:
        return 'profile_view';
      case NotificationType.follow:
        return 'follow';
      case NotificationType.congratulation:
        return 'congratulation';
      case NotificationType.event:
        return 'event';
    }
  }
}
