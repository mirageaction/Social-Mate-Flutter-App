import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/domain/repos/profile_repo.dart';

@injectable
class GetProfileUsecase {
  final ProfileRepo profileRepo;

  GetProfileUsecase(this.profileRepo);

  Future<ProfileEntity> call() async {
    return profileRepo.getProfile();
  }
}