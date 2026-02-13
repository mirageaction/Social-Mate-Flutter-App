import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/inbox/data/datasources/inbox_remote_data_source.dart';
import 'package:social_mate_app/features/inbox/data/models/chat_room_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: InboxRemoteDataSource)
class InboxRemoteDataSourceImpl implements InboxRemoteDataSource {
  final SupabaseClient _supabaseClient;

  InboxRemoteDataSourceImpl(this._supabaseClient);

 @override
Stream<List<ChatRoomModel>> streamChatRooms() {
  final currentUserId = _supabaseClient.auth.currentUser?.id;
  if (currentUserId == null) return Stream.value([]);
  return _supabaseClient
      .from('chat_room_participants')
      .stream(primaryKey: ['room_id', 'user_id'])
      .eq('user_id', currentUserId)
      .asyncMap((event) async {
        if (event.isEmpty) return [];
        final roomIds = event.map((e) => e['room_id'] as String).toList();
        // Join the 'users' table using the junction logic
        // We select the room data and all users associated with it
        final response = await _supabaseClient
            .from('chat_rooms')
            .select('*, users:chat_room_participants(users(*))') 
            .inFilter('id', roomIds);
        // Flatten the double-nested 'users' list from the junction table join
        final formattedResponse = response.map((room) {
          final participants = room['users'] as List? ?? [];
          room['users'] = participants.map((p) => p['users']).toList();
          return room;
        }).toList();
        return formattedResponse
            .map((json) => ChatRoomModel.fromJson(json, currentUserId))
            .toList();
      });
}

  @override
  Future<void> deleteChatRoom(String roomId) async {
    await _supabaseClient.from('chat_rooms').delete().eq('id', roomId);
  }
}
