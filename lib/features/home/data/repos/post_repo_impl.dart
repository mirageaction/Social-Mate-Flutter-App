import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/home/data/local/post_local_datasource.dart';
import 'package:social_mate_app/features/home/data/remote/post_remote_datasource.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/home/domain/repos/post_repo.dart';

@LazySingleton(as: PostRepo)
class PostRepoImpl implements PostRepo {
  final PostRemoteDatasource _postRemoteDatasource;
  final PostLocalDatasource _postLocalDatasource;

  PostRepoImpl(this._postRemoteDatasource, this._postLocalDatasource);

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      final posts = await _postRemoteDatasource.getPosts();
      await _postLocalDatasource.cachePosts(posts);
      return posts;
    } catch (e) {
      // Fallback to local cache if network fails
      // final cachedPosts = await _postLocalDatasource.getCachedPosts();
      // if (cachedPosts.isNotEmpty) {
      //   return cachedPosts;
      // }
      rethrow;
    }
  }

  @override
  Future<void> toggleLike(PostEntity post) {
    return _postRemoteDatasource.toggleLike(post);
  }

  @override
  Future<void> toggleDislike(PostEntity post) {
    return _postRemoteDatasource.toggleDislike(post);
  }
}
