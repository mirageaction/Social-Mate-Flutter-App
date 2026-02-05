import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/models/story_model.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/story_viewer/data/remote/story_viewer_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: StoryViewerRemoteDatasource)
class StoryViewerRemoteDatasourceImpl implements StoryViewerRemoteDatasource {
  final SupabaseClient supabaseClient;

  StoryViewerRemoteDatasourceImpl({required this.supabaseClient});

  @override
  Future<List<StoryEntity>> getAuthorStories(String authorId) async {
    try {
      final response = await supabaseClient
          .from('stories')
          .select('''
          id,
          created_at,
          expires_at,
          author_id,
          media_url,
          bg_color,
          content,
          type,
          users:author_id (
            id,
            name,
            email,
            phone,
            avatar_url
          )
        ''')
          .eq('author_id', authorId)
          .gt('expires_at', DateTime.now().toIso8601String())
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => StoryModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
