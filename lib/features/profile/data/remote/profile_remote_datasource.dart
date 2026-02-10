import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRemoteDatasource {
  Future<ProfileEntity> getProfile();
  Future<ProfileEntity> getProfileById(String userId);
  Future<void> followUser(String userId);
  Future<void> unfollowUser(String userId);
}
