import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/inbox/data/datasources/inbox_remote_data_source.dart';
import 'package:social_mate_app/features/inbox/domain/entities/chat_room.dart';
import 'package:social_mate_app/features/inbox/domain/repos/inbox_repository.dart';

@LazySingleton(as: InboxRepository)
class InboxRepositoryImpl implements InboxRepository {
  final InboxRemoteDataSource _remoteDataSource;

  InboxRepositoryImpl(this._remoteDataSource);

  @override
  Stream<List<ChatRoom>> streamChatRooms() {
    return _remoteDataSource.streamChatRooms();
  }

  @override
  Future<void> deleteChatRoom(String roomId) {
    return _remoteDataSource.deleteChatRoom(roomId);
  }
}
