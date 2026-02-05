import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';

abstract class StoryViewerRemoteDatasource {
  Future<List<StoryEntity>> getAuthorStories(String authorId);
}