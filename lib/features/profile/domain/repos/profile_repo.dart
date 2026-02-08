import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepo {
  Future<ProfileEntity> getProfile();
}