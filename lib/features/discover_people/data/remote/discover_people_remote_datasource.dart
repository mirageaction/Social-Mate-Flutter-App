import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

abstract class DiscoverPeopleRemoteDataSource {
  Future<List<ProfileEntity>> getSuggestedUsers();
  Future<void> followUser(String userId);
  Future<void> unfollowUser(String userId);
}
