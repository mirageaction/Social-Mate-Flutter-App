import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/domain/usecases/follow_user_usecase.dart';
import 'package:social_mate_app/features/discover_people/domain/usecases/get_suggested_users_usecase.dart';
import 'package:social_mate_app/features/discover_people/domain/usecases/unfollow_user_usecase.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

part 'discover_people_event.dart';
part 'discover_people_state.dart';

@injectable
class DiscoverPeopleBloc
    extends Bloc<DiscoverPeopleEvent, DiscoverPeopleState> {
  final GetSuggestedUsersUseCase _getSuggestedUsersUseCase;
  final FollowUserUseCase _followUserUseCase;
  final UnfollowUserUseCase _unfollowUserUseCase;

  DiscoverPeopleBloc(
    this._getSuggestedUsersUseCase,
    this._followUserUseCase,
    this._unfollowUserUseCase,
  ) : super(DiscoverPeopleInitial()) {
    on<GetDiscoverPeopleEvent>(_onGetDiscoverPeople);
    on<FollowUserEvent>(_onFollowUser);
    on<UnfollowUserEvent>(_onUnfollowUser);
  }

  Future<void> _onGetDiscoverPeople(
    GetDiscoverPeopleEvent event,
    Emitter<DiscoverPeopleState> emit,
  ) async {
    emit(DiscoverPeopleLoading());
    try {
      final users = await _getSuggestedUsersUseCase();
      emit(DiscoverPeopleLoaded(users: users));
    } catch (e) {
      emit(DiscoverPeopleError(message: e.toString()));
    }
  }

  Future<void> _onFollowUser(
    FollowUserEvent event,
    Emitter<DiscoverPeopleState> emit,
  ) async {
    final currentState = state;
    if (currentState is DiscoverPeopleLoaded) {
      try {
        final updatedUsers = currentState.users.map((user) {
          if (user.id == event.userId) {
            return user.copyWith(
              isFollowing: true,
              followersCount: user.followersCount + 1,
            );
          }
          return user;
        }).toList();

        emit(DiscoverPeopleLoaded(users: updatedUsers));
        await _followUserUseCase(event.userId);
      } catch (e) {
        emit(DiscoverPeopleError(message: e.toString()));
      }
    }
  }

  Future<void> _onUnfollowUser(
    UnfollowUserEvent event,
    Emitter<DiscoverPeopleState> emit,
  ) async {
    final currentState = state;
    if (currentState is DiscoverPeopleLoaded) {
      try {
        final updatedUsers = currentState.users.map((user) {
          if (user.id == event.userId) {
            return user.copyWith(
              isFollowing: false,
              followersCount: user.followersCount > 0
                  ? user.followersCount - 1
                  : 0,
            );
          }
          return user;
        }).toList();

        emit(DiscoverPeopleLoaded(users: updatedUsers));
        await _unfollowUserUseCase(event.userId);
      } catch (e) {
        emit(DiscoverPeopleError(message: e.toString()));
      }
    }
  }
}
