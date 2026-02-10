import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/profile/data/models/profile_model.dart';
import 'package:social_mate_app/features/profile/data/remote/profile_remote_datasource.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final SupabaseClient _supabaseClient;

  ProfileRemoteDatasourceImpl(this._supabaseClient);

  @override
  Future<ProfileEntity> getProfile() async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) throw Exception("User not authenticated");

      final response = await _supabaseClient
          .from('users')
          .select()
          .eq('id', userId)
          .single();

      return ProfileModel.fromJson(response, userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileEntity> getProfileById(String userId) async {
    try {
      final currentLoggedUserId = _supabaseClient.auth.currentUser?.id;
      if (currentLoggedUserId == null) {
        throw Exception('User is not authenticated');
      }

      final response = await _supabaseClient
          .from('users')
          .select('*, follows!following_id(follower_id)')
          .eq('id', userId)
          .single();

      return ProfileModel.fromJson(response, currentLoggedUserId);
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


      //await _supabaseClient.from('follows').insert({
      //  'follower_id': currentUserId,
      //  'following_id': userId,
      //});
      await _supabaseClient
          .from('follows')
          .upsert(
            {'follower_id': currentUserId, 'following_id': userId},
            onConflict: 'follower_id, following_id',
            ignoreDuplicates: true,
          );
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
