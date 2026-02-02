import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class AuthListener {
  final SupabaseClient _client;

  AuthListener(this._client);

  Stream<AuthState> listen() {
    return _client.auth.onAuthStateChange;
  }
}
