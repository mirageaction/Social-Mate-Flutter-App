import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/remote/story_remote_datasource.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/story_repo.dart';

@LazySingleton(as: StoryRepo)
class StoryRepoImpl implements StoryRepo {
  final StoryRemoteDataSource storyRemoteDataSource;
  StoryRepoImpl({required this.storyRemoteDataSource});
  
  @override
  Future<List<StoryEntity>> getStories() {
    return storyRemoteDataSource.getStories();
  }
}