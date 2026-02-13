import 'package:social_mate_app/features/inbox/data/models/chat_room_model.dart';

abstract class InboxRemoteDataSource {
  Stream<List<ChatRoomModel>> streamChatRooms();
  Future<void> deleteChatRoom(String roomId);
}
