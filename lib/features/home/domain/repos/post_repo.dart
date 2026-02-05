import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEntity>> getPosts();
}