import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/enums/post_type.dart';
import 'package:social_mate_app/features/create_post/data/remote/create_post_remote_datasource.dart';
import 'package:social_mate_app/features/create_post/domain/repos/create_post_repo.dart';

@LazySingleton(as: CreatePostRepo)
class CreatePostRepoImpl implements CreatePostRepo {
  final CreatePostRemoteDataSource _remoteDataSource;

  CreatePostRepoImpl(this._remoteDataSource);

  @override
  Future<void> createPost({
    required String content,
    File? media,
    required PostType postType,
  }) async {
    return await _remoteDataSource.createPost(
      content: content,
      media: media,
      postType: postType,
    );
  }
}
