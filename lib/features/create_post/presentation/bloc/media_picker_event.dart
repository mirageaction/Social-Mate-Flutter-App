part of 'media_picker_bloc.dart';

sealed class MediaPickerEvent extends Equatable {
  final PostType type;
  const MediaPickerEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class PickImageFromGalleryEvent extends MediaPickerEvent {
  const PickImageFromGalleryEvent({required super.type});

  @override
  List<Object> get props => [type];
}

class PickImageFromCameraEvent extends MediaPickerEvent {
  const PickImageFromCameraEvent({required super.type});

  @override
  List<Object> get props => [type];
}

class PickVideoFromGalleryEvent extends MediaPickerEvent {
  const PickVideoFromGalleryEvent({required super.type});

  @override
  List<Object> get props => [type];
}

class PickVideoFromCameraEvent extends MediaPickerEvent {
  const PickVideoFromCameraEvent({required super.type});

  @override
  List<Object> get props => [type];
}

class PickDocumentEvent extends MediaPickerEvent {
  const PickDocumentEvent({required super.type});

  @override
  List<Object> get props => [type];
}

class ClearMediaEvent extends MediaPickerEvent {
  const ClearMediaEvent({required super.type});

  @override
  List<Object> get props => [type];
}
