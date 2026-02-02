part of 'app_flow_bloc.dart';

enum AppFlowStatus { unknown, authenticated, unauthenticated }

class AppFlowState {
  final AppFlowStatus status;
  final Session? session;

  const AppFlowState({
    required this.status,
    this.session,
  });
}
