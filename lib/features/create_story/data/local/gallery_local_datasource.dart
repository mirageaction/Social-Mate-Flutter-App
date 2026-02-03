import 'package:photo_manager/photo_manager.dart';

abstract class GalleryLocalDataSource {
  Future<List<AssetEntity>> getPhotos();
}