import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/enums/post_media_type.dart';
import 'package:social_mate_app/features/create_post/domain/repos/create_post_repo.dart';

@lazySingleton
class CreatePostUsecase {
  final CreatePostRepo _repo;

  CreatePostUsecase(this._repo);

  Future<void> call({
    required String content,
    File? media,
    required PostMediaType mediaType,
  }) async {
    return await _repo.createPost(
      content: content,
      media: media,
      mediaType: mediaType,
    );
  }
}
