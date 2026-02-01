import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthRepo {
  Future<void> signIn(SignInEntity params);
  Future<void> signUp(SignUpEntity params);
  Future<void> signOut();
}