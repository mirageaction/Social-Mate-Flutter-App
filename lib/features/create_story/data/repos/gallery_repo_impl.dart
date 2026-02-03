import 'package:injectable/injectable.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_mate_app/features/create_story/data/local/gallery_local_datasource.dart';
import 'package:social_mate_app/features/create_story/domain/repos/gallery_repo.dart';

@LazySingleton(as: GalleryRepo)
class GalleryRepoImpl implements GalleryRepo {
  final GalleryLocalDataSource galleryLocalDataSource;

  GalleryRepoImpl({required this.galleryLocalDataSource});

  @override
  Future<List<AssetEntity>> getPhotos() async {
    return await galleryLocalDataSource.getPhotos();
  }
}