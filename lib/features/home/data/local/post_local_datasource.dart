import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';

abstract class PostLocalDatasource {
  Future<List<PostEntity>> getCachedPosts();
  Future<void> cachePosts(List<PostEntity> posts);
  Future<void> clearCache();
}
