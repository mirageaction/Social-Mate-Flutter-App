import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/data/remote/auth_remote_datasource.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:social_mate_app/features/auth/domain/repos/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl(this.remoteDataSource);

  @override
  Future<void> signIn(SignInEntity params) async {
    await remoteDataSource.signIn(params);
  }

  @override
  Future<void> signUp(SignUpEntity params) async {
    await remoteDataSource.signUp(params);
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }
}