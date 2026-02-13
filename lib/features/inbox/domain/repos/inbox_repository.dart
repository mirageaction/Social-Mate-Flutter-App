import 'package:social_mate_app/features/inbox/domain/entities/chat_room.dart';

abstract class InboxRepository {
  Stream<List<ChatRoom>> streamChatRooms();
  Future<void> deleteChatRoom(String roomId);
}
