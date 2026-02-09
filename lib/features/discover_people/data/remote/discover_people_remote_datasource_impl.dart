import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/data/remote/discover_people_remote_datasource.dart';
import 'package:social_mate_app/features/profile/data/models/profile_model.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: DiscoverPeopleRemoteDataSource)
class DiscoverPeopleRemoteDataSourceImpl
    implements DiscoverPeopleRemoteDataSource {
  final SupabaseClient _supabaseClient;

  DiscoverPeopleRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<ProfileEntity>> getSuggestedUsers() async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }
      final response = await _supabaseClient
          .from('users')
          .select('*, follows!following_id(follower_id)')
          .neq('id', currentUserId)
          .order('name', ascending: true);

      return response.map((e) {
        final data = Map<String, dynamic>.from(e);
        final follows = data['follows'] as List?;
        data['is_following'] =
            follows?.any((f) => f['follower_id'] == currentUserId) ?? false;
        return ProfileModel.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> followUser(String userId) async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }

      await _supabaseClient.from('follows').insert({
        'follower_id': currentUserId,
        'following_id': userId,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> unfollowUser(String userId) async {
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        throw Exception('User is not authenticated');
      }

      await _supabaseClient.from('follows').delete().match({
        'follower_id': currentUserId,
        'following_id': userId,
      });
    } catch (e) {
      rethrow;
    }
  }
}
