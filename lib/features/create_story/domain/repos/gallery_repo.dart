import 'package:photo_manager/photo_manager.dart';

abstract class GalleryRepo {
  Future<List<AssetEntity>> getPhotos();
}