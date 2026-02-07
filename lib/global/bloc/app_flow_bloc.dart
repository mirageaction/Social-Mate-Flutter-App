import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/services/auth_listener.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_flow_state.dart';

@LazySingleton()
class AppFlowBloc extends Cubit<AppFlowState> {
  final AuthListener authListener;

  late final StreamSubscription _sub;

  AppFlowBloc(this.authListener)
    : super(
        authListener.currentSession != null
            ? AppFlowState(
                status: AppFlowStatus.authenticated,
                session: authListener.currentSession,
              )
            : const AppFlowState(status: AppFlowStatus.unknown),
      ) {
    _sub = authListener.listen().listen((data) async {
      final event = data.event;
      final session = data.session;

      if (session != null) {
        emit(
          AppFlowState(status: AppFlowStatus.authenticated, session: session),
        );
      } else {
        if (event == AuthChangeEvent.initialSession ||
            event == AuthChangeEvent.signedOut) {
          emit(const AppFlowState(status: AppFlowStatus.unauthenticated));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
