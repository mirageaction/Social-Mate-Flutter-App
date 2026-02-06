part of 'media_picker_bloc.dart';

sealed class MediaPickerState extends Equatable {
  const MediaPickerState();
  
  @override
  List<Object?> get props => [];
}

final class MediaPickerInitial extends MediaPickerState {}

final class MediaPickerLoading extends MediaPickerState {}

final class MediaPickerSuccess extends MediaPickerState {
  final File? file;

  const MediaPickerSuccess({required this.file});

  @override
  List<Object?> get props => [file];
}

final class MediaPickerError extends MediaPickerState {
  final String message;

  const MediaPickerError({required this.message});

  @override
  List<Object> get props => [message];
}

