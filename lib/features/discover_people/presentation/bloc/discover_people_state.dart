part of 'discover_people_bloc.dart';

abstract class DiscoverPeopleState extends Equatable {
  const DiscoverPeopleState();

  @override
  List<Object> get props => [];
}

class DiscoverPeopleInitial extends DiscoverPeopleState {}

class DiscoverPeopleLoading extends DiscoverPeopleState {}

class DiscoverPeopleLoaded extends DiscoverPeopleState {
  final List<ProfileEntity> users;

  const DiscoverPeopleLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class DiscoverPeopleError extends DiscoverPeopleState {
  final String message;

  const DiscoverPeopleError({required this.message});

  @override
  List<Object> get props => [message];
}

class DiscoverPeopleFollowed extends DiscoverPeopleState {
  final String userId;

  const DiscoverPeopleFollowed({required this.userId});

  @override
  List<Object> get props => [userId];
}

class DiscoverPeopleUnfollowed extends DiscoverPeopleState {
  final String userId;

  const DiscoverPeopleUnfollowed({required this.userId});

  @override
  List<Object> get props => [userId];
}


