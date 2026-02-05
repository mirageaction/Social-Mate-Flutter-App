import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/models/post_model.dart';
import 'package:social_mate_app/features/home/data/remote/post_remote_datasource.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: PostRemoteDatasource)
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final SupabaseClient _supabaseClient;
  PostRemoteDatasourceImpl(this._supabaseClient);

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      final response = await _supabaseClient
          .from('posts')
          .select('''
        id,
        content,
        media_url,
        author_id,
        created_at,
        likes,
        users:author_id (
          id,
          name,
          avatar_url
        )
      ''')
          .order('created_at', ascending: false);
      return response.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
