import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/story_viewer/data/remote/story_viewer_remote_datasource.dart';
import 'package:social_mate_app/features/story_viewer/domain/repos/story_viewer_repo.dart';

@LazySingleton(as: StoryViewerRepo)
class StoryViewerRepoImpl implements StoryViewerRepo {
  final StoryViewerRemoteDatasource remoteDatasource;

  StoryViewerRepoImpl({required this.remoteDatasource});

  @override
  Future<List<StoryEntity>> getAuthorStories(String authorId) {
    return remoteDatasource.getAuthorStories(authorId);
  }
}
