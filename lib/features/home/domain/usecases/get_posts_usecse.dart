import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/post_repo.dart';

@lazySingleton
class GetPostsUsecse {
  final PostRepo _postRepo;

  GetPostsUsecse(this._postRepo);

  Future<List<PostEntity>> call() async {
    return await _postRepo.getPosts();
  }
}