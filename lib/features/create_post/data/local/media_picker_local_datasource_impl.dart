import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/create_post/data/local/media_picker_local_datasource.dart';

@LazySingleton(as: MediaPickerLocalDataSource)
class MediaPickerLocalDataSourceImpl implements MediaPickerLocalDataSource {
  final ImagePicker _picker;
  MediaPickerLocalDataSourceImpl(this._picker);

  @override
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        //imageQuality: 80, // compress
      );

      if (image == null) return null;
      return File(image.path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image == null) return null;
      return File(image.path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<File?> pickVideoFromGallery() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

      if (video == null) return null;
      return File(video.path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<File?> pickVideoFromCamera() async {
    try {
      final XFile? video = await _picker.pickVideo(source: ImageSource.camera);

      if (video == null) return null;
      return File(video.path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<File?> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'zip', 'ppt', 'xls'],
    );

    if (result == null) return null;

    return File(result.files.single.path!);
  }
}
