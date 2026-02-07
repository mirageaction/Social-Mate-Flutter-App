part of 'media_picker_bloc.dart';

sealed class MediaPickerEvent extends Equatable {
  const MediaPickerEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromGalleryEvent extends MediaPickerEvent {
  final MediaPickerType type;
  const PickImageFromGalleryEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class PickImageFromCameraEvent extends MediaPickerEvent {
  final MediaPickerType type;
  const PickImageFromCameraEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class PickVideoFromGalleryEvent extends MediaPickerEvent {
  final MediaPickerType type;
  const PickVideoFromGalleryEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class PickVideoFromCameraEvent extends MediaPickerEvent {
  final MediaPickerType type;
  const PickVideoFromCameraEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class PickDocumentEvent extends MediaPickerEvent {
  final MediaPickerType type;
  const PickDocumentEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class ClearMediaEvent extends MediaPickerEvent {
  final MediaPickerType type;
  const ClearMediaEvent({required this.type});

  @override
  List<Object> get props => [type];
}
