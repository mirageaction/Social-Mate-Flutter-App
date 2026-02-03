part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();
  
  @override
  List<Object> get props => [];
}

final class GalleryInitial extends GalleryState {}

final class GalleryLoading extends GalleryState {}

final class GalleryLoaded extends GalleryState {
  final List<AssetEntity> photos;
  const GalleryLoaded({required this.photos});
  @override
  List<Object> get props => [photos];
}

final class GalleryError extends GalleryState {
  final String message;
  const GalleryError({required this.message});
  @override
  List<Object> get props => [message];
}

