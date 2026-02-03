import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/services/auth_listener.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_flow_state.dart';

@LazySingleton()
class AppFlowBloc extends Cubit<AppFlowState> {
  final AuthListener authListener;

  late final StreamSubscription _sub;

  AppFlowBloc(this.authListener)
    : super(const AppFlowState(status: AppFlowStatus.unknown)) {
    _sub = authListener.listen().listen((data) async {
      final event = data.event;
      final session = data.session;

      // 1. Handle explicit sign out or deletion events
      if (event == AuthChangeEvent.signedOut ||
          event == AuthChangeEvent.userDeleted) {
        emit(const AppFlowState(status: AppFlowStatus.unauthenticated));
        return;
      }

      if (session != null) {
        // 2. On initial load or token refresh, verify if the user still exists in DB.
        // This handles cases where the user was deleted from the Supabase dashboard
        // but the client still has a cached JWT.
        if (event == AuthChangeEvent.initialSession ||
            event == AuthChangeEvent.tokenRefreshed) {
          final user = await authListener.getUser();
          if (user == null) {
            emit(const AppFlowState(status: AppFlowStatus.unauthenticated));
            return;
          }
        }

        emit(
          AppFlowState(status: AppFlowStatus.authenticated, session: session),
        );
      } else {
        emit(const AppFlowState(status: AppFlowStatus.unauthenticated));
      }
    });
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
