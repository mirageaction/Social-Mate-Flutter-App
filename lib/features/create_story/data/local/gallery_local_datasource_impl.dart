import 'package:injectable/injectable.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_mate_app/features/create_story/data/local/gallery_local_datasource.dart';

@LazySingleton(as: GalleryLocalDataSource)
class GalleryLocalDatasourceImpl implements GalleryLocalDataSource {
  @override
  Future<List<AssetEntity>> getPhotos() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    if (!ps.isAuth) {
      // Permission denied
      return [];
    }

    // Get "All Photos" album
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
      filterOption: FilterOptionGroup(
        orders: [
          const OrderOption(type: OrderOptionType.createDate, asc: false),
        ],
      ),
    );

    if (paths.isEmpty) return [];

    final AssetPathEntity allPhotos = paths.first;

    // Load images (pagination)
    final List<AssetEntity> photos = await allPhotos.getAssetListPaged(
      page: 0,
      size: 1000,
    );
    return photos;
  }
}
