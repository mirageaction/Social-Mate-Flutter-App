import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/story_viewer/domain/repos/story_viewer_repo.dart';

@lazySingleton
class GetAuthorStoriesUseCase {
  final StoryViewerRepo repository;

  GetAuthorStoriesUseCase({required this.repository});

  Future<List<StoryEntity>> call(String authorId) {
    return repository.getAuthorStories(authorId);
  }
}
