import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/inbox/domain/repos/inbox_repository.dart';

@lazySingleton
class DeleteChatRoomUsecase {
  final InboxRepository _inboxRepository;

  DeleteChatRoomUsecase(this._inboxRepository);

  Future<void> call(String roomId) async {
    await _inboxRepository.deleteChatRoom(roomId);
  }
}