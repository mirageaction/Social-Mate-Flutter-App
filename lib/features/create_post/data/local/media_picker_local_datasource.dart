import 'dart:io';

abstract class MediaPickerLocalDataSource {
  Future<File?> pickImageFromGallery();
  Future<File?> pickImageFromCamera();
  Future<File?> pickVideoFromGallery();
  Future<File?> pickVideoFromCamera();
  Future<File?> pickDocument();
}
