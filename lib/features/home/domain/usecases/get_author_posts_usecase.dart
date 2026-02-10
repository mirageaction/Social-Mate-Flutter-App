import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/post_repo.dart';

@lazySingleton
class GetAuthorPostsUseCase {
  final PostRepo postRepo;

  GetAuthorPostsUseCase(this.postRepo);

  Future<List<PostEntity>> call(String? userId) async {
    return postRepo.getAuthorPosts(userId);
  }
}