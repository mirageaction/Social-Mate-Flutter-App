import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/data/remote/discover_people_remote_datasource.dart';
import 'package:social_mate_app/features/discover_people/domain/repos/discover_people_repo.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

@LazySingleton(as: DiscoverPeopleRepo)
class DiscoverPeopleRepoImpl implements DiscoverPeopleRepo {
  final DiscoverPeopleRemoteDataSource _discoverPeopleRemoteDataSource;

  DiscoverPeopleRepoImpl(this._discoverPeopleRemoteDataSource);

  @override
  Future<List<ProfileEntity>> getSuggestedUsers() async {
    return await _discoverPeopleRemoteDataSource.getSuggestedUsers();
  }

  @override
  Future<void> followUser(String userId) async {
    await _discoverPeopleRemoteDataSource.followUser(userId);
  }

  @override
  Future<void> unfollowUser(String userId) async {
    await _discoverPeopleRemoteDataSource.unfollowUser(userId);
  }
}
