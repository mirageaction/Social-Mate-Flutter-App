import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:social_mate_app/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class SignUpUsecase {
  final AuthRepo repo;

  SignUpUsecase(this.repo);

  Future<void> call(SignUpEntity params) async {
    await repo.signUp(params);
  }
}