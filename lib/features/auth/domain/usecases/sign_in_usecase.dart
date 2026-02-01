import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class SignInUsecase {
  final AuthRepo repo;

  SignInUsecase(this.repo);

  Future<void> call(SignInEntity params) async {
    await repo.signIn(params);
  }
}