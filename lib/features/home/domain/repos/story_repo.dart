import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';

abstract class StoryRepo {
  Future<List<StoryEntity>> getStories();
}