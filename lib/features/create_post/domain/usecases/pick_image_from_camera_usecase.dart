import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/create_post/domain/repos/media_picker_repo.dart';

@LazySingleton()
class PickImageFromCameraUsecase {
  final MediaPickerRepo _mediaPickerRepo;

  PickImageFromCameraUsecase(this._mediaPickerRepo);

  Future<File?> call() async {
    return await _mediaPickerRepo.pickImageFromCamera();
  }
}