import 'package:equatable/equatable.dart';
import 'package:social_mate_app/global/domain/entities/user_entity.dart';

class ChatRoom extends Equatable {
  final String id;
  final UserEntity otherParticipant;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isOnline;

  const ChatRoom({
    required this.id,
    required this.otherParticipant,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isOnline = false,
  });

  @override
  List<Object?> get props => [
    id,
    otherParticipant,
    lastMessage,
    lastMessageTime,
    unreadCount,
    isOnline,
  ];
}
