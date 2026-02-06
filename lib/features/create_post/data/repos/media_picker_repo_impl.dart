import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/create_post/data/local/media_picker_local_datasource.dart';
import 'package:social_mate_app/features/create_post/domain/repos/media_picker_repo.dart';

@LazySingleton(as: MediaPickerRepo)
class MediaPickerRepoImpl implements MediaPickerRepo {
  final MediaPickerLocalDataSource _mediaPickerLocalDataSource;

  MediaPickerRepoImpl(this._mediaPickerLocalDataSource);

  @override
  Future<File?> pickImageFromGallery() async {
    return await _mediaPickerLocalDataSource.pickImageFromGallery();
  }

  @override
  Future<File?> pickImageFromCamera() async {
    return await _mediaPickerLocalDataSource.pickImageFromCamera();
  }

  @override
  Future<File?> pickVideoFromGallery() async {
    return await _mediaPickerLocalDataSource.pickVideoFromGallery();
  }

  @override
  Future<File?> pickVideoFromCamera() async {
    return await _mediaPickerLocalDataSource.pickVideoFromCamera();
  }
}