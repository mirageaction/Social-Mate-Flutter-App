import 'dart:io';

import 'package:social_mate_app/core/enums/post_type.dart';

abstract class CreatePostRemoteDataSource {
  Future<void> createPost({
    required String content,
    File? media,
    required PostType postType,
  });
}
