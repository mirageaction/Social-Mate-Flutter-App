import 'dart:io';

import 'package:social_mate_app/core/enums/post_media_type.dart';

abstract class CreatePostRepo {
  Future<void> createPost({
    required String content,
    File? media,
    required PostMediaType mediaType,
  });
}
