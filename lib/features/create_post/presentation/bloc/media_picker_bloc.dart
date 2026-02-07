import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/create_post/domain/usecases/pick_document_usecase.dart';
import 'package:social_mate_app/features/create_post/domain/usecases/pick_image_from_camera_usecase.dart';
import 'package:social_mate_app/features/create_post/domain/usecases/pick_image_from_gallery_usecase.dart';
import 'package:social_mate_app/features/create_post/domain/usecases/pick_video_from_camera_usecase.dart';
import 'package:social_mate_app/features/create_post/domain/usecases/pick_video_from_gallery_usecase.dart';

part 'media_picker_event.dart';
part 'media_picker_state.dart';

@injectable
class MediaPickerBloc extends Bloc<MediaPickerEvent, MediaPickerState> {
  final PickImageFromCameraUsecase _pickImageFromCameraUsecase;
  final PickImageFromGalleryUsecase _pickImageFromGalleryUsecase;
  final PickVideoFromCameraUsecase _pickVideoFromCameraUsecase;
  final PickVideoFromGalleryUsecase _pickVideoFromGalleryUsecase;
  final PickDocumentUsecase _pickDocumentUsecase;

  MediaPickerBloc(
    this._pickImageFromCameraUsecase,
    this._pickImageFromGalleryUsecase,
    this._pickVideoFromCameraUsecase,
    this._pickVideoFromGalleryUsecase,
    this._pickDocumentUsecase,
  ) : super(MediaPickerInitial(type: MediaPickerType.initial)) {
    on<PickImageFromGalleryEvent>(_onPickImageFromGalleryEvent);
    on<PickImageFromCameraEvent>(_onPickImageFromCameraEvent);
    on<PickVideoFromGalleryEvent>(_onPickVideoFromGalleryEvent);
    on<PickVideoFromCameraEvent>(_onPickVideoFromCameraEvent);
    on<PickDocumentEvent>(_onPickDocumentEvent);
    on<ClearMediaEvent>(_onClearMediaEvent);
  }

  Future<void> _onPickDocumentEvent(
    PickDocumentEvent event,
    Emitter<MediaPickerState> emit,
  ) async {
    try {
      emit(MediaPickerLoading(type: event.type));
      final result = await _pickDocumentUsecase();
      emit(MediaPickerSuccess(file: result, type: event.type));
    } catch (e) {
      emit(MediaPickerError(message: e.toString(), type: event.type));
    }
  }

  Future<void> _onPickImageFromGalleryEvent(
    PickImageFromGalleryEvent event,
    Emitter<MediaPickerState> emit,
  ) async {
    try {
      emit(MediaPickerLoading(type: event.type));
      final result = await _pickImageFromGalleryUsecase();
      emit(MediaPickerSuccess(file: result, type: event.type));
    } catch (e) {
      emit(MediaPickerError(message: e.toString(), type: event.type));
    }
  }

  Future<void> _onPickImageFromCameraEvent(
    PickImageFromCameraEvent event,
    Emitter<MediaPickerState> emit,
  ) async {
    try {
      emit(MediaPickerLoading(type: event.type));
      final result = await _pickImageFromCameraUsecase();
      emit(MediaPickerSuccess(file: result, type: event.type));
    } catch (e) {
      emit(MediaPickerError(message: e.toString(), type: event.type));
    }
  }

  Future<void> _onPickVideoFromGalleryEvent(
    PickVideoFromGalleryEvent event,
    Emitter<MediaPickerState> emit,
  ) async {
    try {
      emit(MediaPickerLoading(type: event.type));
      final result = await _pickVideoFromGalleryUsecase();
      emit(MediaPickerSuccess(file: result, type: event.type));
    } catch (e) {
      emit(MediaPickerError(message: e.toString(), type: event.type));
    }
  }

  Future<void> _onPickVideoFromCameraEvent(
    PickVideoFromCameraEvent event,
    Emitter<MediaPickerState> emit,
  ) async {
    try {
      emit(MediaPickerLoading(type: event.type));
      final result = await _pickVideoFromCameraUsecase();
      emit(MediaPickerSuccess(file: result, type: event.type));
    } catch (e) {
      emit(MediaPickerError(message: e.toString(), type: event.type));
    }
  }

  void _onClearMediaEvent(
    ClearMediaEvent event,
    Emitter<MediaPickerState> emit,
  ) {
    emit(MediaPickerInitial(type: event.type));
  }
}
