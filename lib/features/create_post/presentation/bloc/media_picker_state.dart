part of 'media_picker_bloc.dart';


sealed class MediaPickerState extends Equatable {
  final PostType type;
  const MediaPickerState({required this.type});
  
  @override
  List<Object?> get props => [type];
}

final class MediaPickerInitial extends MediaPickerState {
  const MediaPickerInitial({required super.type});
}

final class MediaPickerLoading extends MediaPickerState {
  const MediaPickerLoading({required super.type});
}

final class MediaPickerSuccess extends MediaPickerState {
  final File? file;

  const MediaPickerSuccess({required this.file, required super.type});

  @override
  List<Object?> get props => [file];
}

final class MediaPickerError extends MediaPickerState {
  final String message;

  const MediaPickerError({required this.message, required super.type});

  @override
  List<Object> get props => [message];
}

