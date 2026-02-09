import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/domain/repos/discover_people_repo.dart';

@lazySingleton
class FollowUserUseCase {
  final DiscoverPeopleRepo _discoverPeopleRepo;

  FollowUserUseCase(this._discoverPeopleRepo);

  Future<void> call(String userId) async {
    return _discoverPeopleRepo.followUser(userId);
  }
}
