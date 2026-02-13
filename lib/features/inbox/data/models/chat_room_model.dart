import 'package:social_mate_app/features/inbox/domain/entities/chat_room.dart';
import 'package:social_mate_app/global/data/models/user_model.dart';

class ChatRoomModel extends ChatRoom {
  const ChatRoomModel({
    required super.id,
    required super.otherParticipant,
    required super.lastMessage,
    required super.lastMessageTime,
    super.unreadCount = 0,
    super.isOnline = false,
  });

  factory ChatRoomModel.fromJson(
    Map<String, dynamic> json,
    String currentUserId,
  ) {
    // 1. the Join will return a list of users in the room
    final List usersJson = json['users'] ?? [];

    // 2. Find the participant that is NOT the current logged-in user
    final otherUserMap = usersJson.firstWhere(
      (u) => u['id'].toString() != currentUserId,
      orElse: () => {},
    );
    return ChatRoomModel(
      id: json['id']?.toString() ?? '',
      otherParticipant: UserModel.fromJson(otherUserMap),
      lastMessage: json['last_message'] ?? '',
      lastMessageTime: DateTime.parse(
        json['last_message_time'] ?? DateTime.now().toIso8601String(),
      ),
      unreadCount: json['unread_count'] ?? 0,
      isOnline: json['is_online'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime.toIso8601String(),
      'unread_count': unreadCount,
      'is_online': isOnline,
    };
  }
}
