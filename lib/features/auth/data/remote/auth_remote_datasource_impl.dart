import 'package:extension/extension.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/data/remote/auth_remote_datasource.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<void> signIn(SignInEntity params) async {
    try {
      await supabase.auth.signInWithPassword(
        email: params.emailOrPhone.isEmail ? params.emailOrPhone : null,
        phone: !params.emailOrPhone.isEmail ? params.emailOrPhone : null,
        password: params.password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
Future<void> signUp(SignUpEntity params) async {
  try {
    final response = await supabase.auth.signUp(
      email: params.emailOrPhone.isEmail ? params.emailOrPhone : null,
      phone: !params.emailOrPhone.isEmail ? params.emailOrPhone : null,
      password: params.password,
      data: {'full_name': params.name},
    );

    if (response.user != null) {
      final String uniqueUsername = await supabase.rpc(
        'generate_unique_username',
        params: {'base_name': params.name},
      );

      await supabase.from('users').insert({
        'id': response.user!.id,
        'username': '@$uniqueUsername',
        'name': params.name,
        'email': params.emailOrPhone.isEmail ? params.emailOrPhone : null,
        'phone': !params.emailOrPhone.isEmail ? params.emailOrPhone : null,
      });
    }
  } catch (e) {
    rethrow;
  }
}

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
