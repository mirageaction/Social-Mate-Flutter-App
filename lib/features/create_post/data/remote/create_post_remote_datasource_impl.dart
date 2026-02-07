import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/enums/post_media_type.dart';
import 'package:social_mate_app/features/create_post/data/remote/create_post_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

@LazySingleton(as: CreatePostRemoteDataSource)
class CreatePostRemoteDataSourceImpl implements CreatePostRemoteDataSource {
  final SupabaseClient _supabaseClient;

  CreatePostRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<void> createPost({
    required String content,
    File? media,
    required PostMediaType mediaType,
  }) async {
    try {
      String? mediaUrl;

      if (media != null) {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}${p.extension(media.path)}';
        final path = 'posts/$fileName';

        await _supabaseClient.storage.from('posts').upload(path, media);
        mediaUrl = _supabaseClient.storage.from('posts').getPublicUrl(path);
      }

      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      await _supabaseClient.from('posts').insert({
        'content': content,
        'media_url': mediaUrl,
        'media_type': media != null ? mediaType.name : null,
        'author_id': userId,
      });
    } catch (e) {
      rethrow;
    }
  }
}
