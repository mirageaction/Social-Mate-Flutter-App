import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/models/story_model.dart';
import 'package:social_mate_app/features/home/data/remote/story_remote_datasource.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: StoryRemoteDataSource)
class StoryRemoteDatasourceImpl implements StoryRemoteDataSource {
  final SupabaseClient supabaseClient;
  StoryRemoteDatasourceImpl({required this.supabaseClient});

  // @override
  // Future<List<StoryEntity>> getStories() async {
  //   try {
  //     final response = await supabaseClient
  //         .from('stories')
  //         .select('*, users(name)') // This joins the users table and selects the name
  //         .order('created_at', ascending: false);

  //     return response.map((json) => StoryModel.fromJson(json)).toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<List<StoryEntity>> getStories() async {
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
          .gt(
            'expires_at',
            DateTime.now().toIso8601String(),
          ) // active stories only
          .order('created_at', ascending: false);

      final allStories = (response as List)
          .map((json) => StoryModel.fromJson(json))
          .toList();

      // Filter to get only the latest story per author
      return _getLatestStoriesPerAuthor(allStories);
    } catch (e) {
      rethrow;
    }
  }

  List<StoryEntity> _getLatestStoriesPerAuthor(List<StoryEntity> stories) {
    final Map<String, StoryEntity> latestStoriesByAuthor = {};

    for (final story in stories) {
      final authorId = story.authorId;

      // If this author doesn't exist yet, or if this story is more recent
      if (!latestStoriesByAuthor.containsKey(authorId) ||
          _isMoreRecent(story, latestStoriesByAuthor[authorId]!)) {
        latestStoriesByAuthor[authorId] = story;
      }
    }

    // Convert map values to list and sort by created_at descending
    final latestStories = latestStoriesByAuthor.values.toList();
    latestStories.sort((a, b) {
      return DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt));
    });

    return latestStories;
  }

  bool _isMoreRecent(StoryEntity story1, StoryEntity story2) {
    final date1 = DateTime.parse(story1.createdAt);
    final date2 = DateTime.parse(story2.createdAt);
    return date1.isAfter(date2);
  }
}
