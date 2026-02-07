import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/post_repo.dart';

@injectable
class ToggleDislikeUsecase {
  final PostRepo _postRepo;

  ToggleDislikeUsecase(this._postRepo);

  Future<void> call(PostEntity post) async {
    return _postRepo.toggleDislike(post);
  }
}
