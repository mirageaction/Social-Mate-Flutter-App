import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/story_repo.dart';

@lazySingleton
class GetStoriesUseCase {
  final StoryRepo storyRepo;

  GetStoriesUseCase(this.storyRepo);

  Future<List<StoryEntity>> call() async {
    return await storyRepo.getStories();
  }
}