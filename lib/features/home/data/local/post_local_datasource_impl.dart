import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/local/post_local_datasource.dart';
import 'package:social_mate_app/features/home/data/models/post_model.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PostLocalDatasource)
class PostLocalDatasourceImpl implements PostLocalDatasource {
  static const String _postsCacheKey = 'cached_posts';

  @override
  Future<void> cachePosts(List<PostEntity> posts) async {
    final prefs = await SharedPreferences.getInstance();
    final postsJson = posts
        .map((post) => (post as PostModel).toJson())
        .toList();
    await prefs.setString(_postsCacheKey, jsonEncode(postsJson));
  }

  @override
  Future<List<PostEntity>> getCachedPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final postsString = prefs.getString(_postsCacheKey);
    if (postsString != null) {
      final List<dynamic> postsJson = jsonDecode(postsString);
      return postsJson.map((json) => PostModel.fromJson(json)).toList();
    }
    return [];
  }
}
