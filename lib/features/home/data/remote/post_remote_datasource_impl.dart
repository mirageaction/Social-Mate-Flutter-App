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
    final userId = _supabaseClient.auth.currentUser?.id;
    if (userId == null) return [];
    try {
      final response = await _supabaseClient
          .from('posts')
          .select('''
        id,
        content,
        media_url,
        media_type,
        author_id,
        created_at,
        likes,
        dislikes,
        users:author_id (
          id,
          name,
          avatar_url
        ),
        is_liked:post_likes (author_id),
        is_disliked:post_dislikes (author_id)
      ''')
          .order('created_at', ascending: false);
      //return response.map((e) => PostModel.fromJson(e)).toList();
      return response.map((e) {
        final data = Map<String, dynamic>.from(e);
        // Map the joined lists to booleans for the Model
        data['is_liked'] = (e['is_liked'] as List).any(
          (l) => l['author_id'] == userId,
        );
        data['is_disliked'] = (e['is_disliked'] as List).any(
          (l) => l['author_id'] == userId,
        );
        return PostModel.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleLike(PostEntity post) async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) return;

      if (!post.isLiked) {
        if (post.isDisliked) {
          await _supabaseClient.from('post_dislikes').delete().match({
            'post_id': post.id,
            'author_id': userId,
          });
        }
        await _supabaseClient.from('post_likes').insert({
          'post_id': post.id,
          'author_id': userId,
        });
      } else {
        await _supabaseClient.from('post_likes').delete().match({
          'post_id': post.id,
          'author_id': userId,
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleDislike(PostEntity post) async {
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) return;

      if (!post.isDisliked) {
        if (post.isLiked) {
          await _supabaseClient.from('post_likes').delete().match({
            'post_id': post.id,
            'author_id': userId,
          });
        }
        await _supabaseClient.from('post_dislikes').insert({
          'post_id': post.id,
          'author_id': userId,
        });
      } else {
        await _supabaseClient.from('post_dislikes').delete().match({
          'post_id': post.id,
          'author_id': userId,
        });
      }
    } catch (e) {
      rethrow;
    }
  }
}
