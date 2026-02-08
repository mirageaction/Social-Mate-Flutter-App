import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/profile/data/remote/profile_remote_datasource.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/domain/repos/profile_repo.dart';

@LazySingleton( as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepoImpl(this.profileRemoteDatasource);

  @override
  Future<ProfileEntity> getProfile() {
    return profileRemoteDatasource.getProfile();
  }
}