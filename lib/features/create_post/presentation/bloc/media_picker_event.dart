part of 'media_picker_bloc.dart';

sealed class MediaPickerEvent extends Equatable {
  const MediaPickerEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromGalleryEvent extends MediaPickerEvent {
  const PickImageFromGalleryEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromCameraEvent extends MediaPickerEvent {
  const PickImageFromCameraEvent();

  @override
  List<Object> get props => [];
}

class PickVideoFromGalleryEvent extends MediaPickerEvent {
  const PickVideoFromGalleryEvent();

  @override
  List<Object> get props => [];
}

class PickVideoFromCameraEvent extends MediaPickerEvent {
  const PickVideoFromCameraEvent();

  @override
  List<Object> get props => [];
}

class ClearMediaEvent extends MediaPickerEvent {
  const ClearMediaEvent();

  @override
  List<Object> get props => [];
}
