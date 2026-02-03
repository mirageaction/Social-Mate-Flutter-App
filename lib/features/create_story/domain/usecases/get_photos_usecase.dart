import 'package:injectable/injectable.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_mate_app/features/create_story/domain/repos/gallery_repo.dart';

@lazySingleton
class GetPhotosUsecase {
  final GalleryRepo galleryRepo;

  GetPhotosUsecase({required this.galleryRepo});

  Future<List<AssetEntity>> call() async {
    return await galleryRepo.getPhotos();
  }
}