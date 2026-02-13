import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/inbox/domain/entities/chat_room.dart';
import 'package:social_mate_app/features/inbox/domain/repos/inbox_repository.dart';

@lazySingleton
class StreamChatRoomsUsecase {
  final InboxRepository _inboxRepository;

  StreamChatRoomsUsecase(this._inboxRepository);

  Stream<List<ChatRoom>> call() {
    return _inboxRepository.streamChatRooms();
  }
}