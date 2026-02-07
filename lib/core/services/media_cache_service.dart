import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MediaCacheService {
  static const String _videoKey = 'post_videos_cache';
  static const String _imageKey = 'post_images_cache';

  /// Cache manager for video files
  static final CacheManager videoCache = CacheManager(
    Config(
      _videoKey,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 50,
      repo: JsonCacheInfoRepository(databaseName: _videoKey),
      fileService: HttpFileService(),
    ),
  );

  /// Cache manager for image files
  static final CacheManager imageCache = CacheManager(
    Config(
      _imageKey,
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: _imageKey),
      fileService: HttpFileService(),
    ),
  );
}
