import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/domain/repos/auth_repo.dart';

@LazySingleton()
class SignOutUsecase {
  final AuthRepo repo;

  SignOutUsecase(this.repo);

  Future<void> call() async {
    await repo.signOut();
  }
}
