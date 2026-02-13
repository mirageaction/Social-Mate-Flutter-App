import 'package:social_mate_app/features/inbox/domain/entities/chat_message.dart';

class MessageModel extends ChatMessage {
  const MessageModel({
    required super.id,
    required super.senderId,
    required super.content,
    required super.createdAt,
    super.isRead = false,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id']?.toString() ?? '',
      senderId: json['sender_id'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toIso8601String(),
      ),
      isRead: json['is_read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'is_read': isRead,
    };
  }
}
