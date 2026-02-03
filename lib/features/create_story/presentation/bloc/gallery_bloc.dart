import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_mate_app/features/create_story/domain/usecases/get_photos_usecase.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

@injectable
class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetPhotosUsecase getPhotosUsecase;

  GalleryBloc({required this.getPhotosUsecase})
    : super(GalleryInitial()) {
    on<GetPhotosEvent>(_onGetPhotos);
  }

  Future<void> _onGetPhotos(
    GetPhotosEvent event,
    Emitter<GalleryState> emit,
  ) async {
    emit(GalleryLoading());
    try {
      final photos = await getPhotosUsecase();
      emit(GalleryLoaded(photos: photos));
    } catch (e) {
      emit(GalleryError(message: e.toString()));
    }
  }
}
