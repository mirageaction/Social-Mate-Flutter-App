import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/domain/repos/discover_people_repo.dart';

@lazySingleton
class UnfollowUserUseCase {
  final DiscoverPeopleRepo _discoverPeopleRepo;

  UnfollowUserUseCase(this._discoverPeopleRepo);

  Future<void> call(String userId) async {
    return _discoverPeopleRepo.unfollowUser(userId);
  }
}
