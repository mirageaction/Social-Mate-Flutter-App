import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/profile/data/remote/profile_remote_datasource.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/domain/repos/profile_repo.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepoImpl(this.profileRemoteDatasource);

  @override
  Future<ProfileEntity> getProfile() {
    return profileRemoteDatasource.getProfile();
  }

  @override
  Future<ProfileEntity> getProfileById(String userId) {
    return profileRemoteDatasource.getProfileById(userId);
  }

  @override
  Future<void> followUser(String userId) {
    return profileRemoteDatasource.followUser(userId);
  }

  @override
  Future<void> unfollowUser(String userId) {
    return profileRemoteDatasource.unfollowUser(userId);
  }

  @override
  Future<void> trackProfileView(String viewedUserId) {
    return profileRemoteDatasource.trackProfileView(viewedUserId);
  }
}
