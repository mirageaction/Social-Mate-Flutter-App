part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class GetProfileEvent extends ProfileEvent {
  final String? userId;
  const GetProfileEvent({this.userId});

  @override
  List<Object> get props => [userId ?? ''];
}

final class FollowUserEvent extends ProfileEvent {
  final String userId;
  const FollowUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

final class UnfollowUserEvent extends ProfileEvent {
  final String userId;
  const UnfollowUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

final class TrackProfileViewEvent extends ProfileEvent {
  final String viewedUserId;
  const TrackProfileViewEvent(this.viewedUserId);

  @override
  List<Object> get props => [viewedUserId];
}

