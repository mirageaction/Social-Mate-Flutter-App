import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/profile/domain/repos/profile_repo.dart';

@lazySingleton
class TrackProfileViewUseCase {
  final ProfileRepo _profileRepo;

  TrackProfileViewUseCase(this._profileRepo);

  Future<void> call(String viewedUserId) {
    return _profileRepo.trackProfileView(viewedUserId);
  }
}