import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/domain/repos/discover_people_repo.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

@lazySingleton
class GetSuggestedUsersUseCase {
  final DiscoverPeopleRepo _discoverPeopleRepo;

  GetSuggestedUsersUseCase(this._discoverPeopleRepo);

  Future<List<ProfileEntity>> call() async {
    return _discoverPeopleRepo.getSuggestedUsers();
  }
}
