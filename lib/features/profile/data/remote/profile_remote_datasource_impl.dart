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
}
