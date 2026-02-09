part of 'discover_people_bloc.dart';

abstract class DiscoverPeopleEvent extends Equatable {
  const DiscoverPeopleEvent();

  @override
  List<Object> get props => [];
}

class GetDiscoverPeopleEvent extends DiscoverPeopleEvent {}

class FollowUserEvent extends DiscoverPeopleEvent {
  final String userId;
  const FollowUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class UnfollowUserEvent extends DiscoverPeopleEvent {
  final String userId;
  const UnfollowUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
