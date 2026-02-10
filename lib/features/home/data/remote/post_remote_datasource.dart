import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';

abstract class PostRemoteDatasource {
  Future<List<PostEntity>> getPosts();
  Future<List<PostEntity>> getAuthorPosts(String? userId);
  Future<void> toggleLike(PostEntity post);
  Future<void> toggleDislike(PostEntity post);
}
