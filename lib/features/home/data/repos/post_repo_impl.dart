import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/remote/post_remote_datasource.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/post_repo.dart';

@LazySingleton(as: PostRepo)
class PostRepoImpl implements PostRepo {
  final PostRemoteDatasource _postRemoteDatasource;

  PostRepoImpl(this._postRemoteDatasource);

  @override
  Future<List<PostEntity>> getPosts() {
    return _postRemoteDatasource.getPosts();
  }
}