import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/discover_people/domain/usecases/follow_user_usecase.dart';
import 'package:social_mate_app/features/discover_people/domain/usecases/unfollow_user_usecase.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:social_mate_app/features/profile/domain/usecases/track_profile_view_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUsecase getProfileUsecase;
  final FollowUserUseCase followUserUsecase;
  final UnfollowUserUseCase unfollowUserUsecase;
  final TrackProfileViewUseCase trackProfileViewUseCase;
  ProfileBloc(
    this.getProfileUsecase,
    this.followUserUsecase,
    this.unfollowUserUsecase,
    this.trackProfileViewUseCase,
  ) : super(ProfileInitial()) {
    on<GetProfileEvent>(_getProfile);
    on<FollowUserEvent>(_followUser);
    on<UnfollowUserEvent>(_unfollowUser);
    on<TrackProfileViewEvent>(_trackProfileView);
  }

  Future<void> _trackProfileView(
    TrackProfileViewEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await trackProfileViewUseCase.call(event.viewedUserId);
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> _getProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final result = await getProfileUsecase.call(userId: event.userId);
      emit(ProfileLoaded(profile: result));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  Future<void> _followUser(
    FollowUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      //Keep a copy of the old profile in case of failure
      final oldProfile = currentState.profile;

      //Update the UI immediately
      final updatedProfile = oldProfile.copyWith(
        isFollowing: true,
        followersCount: oldProfile.followersCount + 1,
      );

      emit(ProfileLoaded(profile: updatedProfile));

      try {
        await followUserUsecase(event.userId);
      } catch (e) {
        //If API fails, revert back to the old profile
        emit(ProfileLoaded(profile: oldProfile));

        //Trigger an error message without changing the state type
        //You can do this by adding a "failure" property to your state
        //or using a separate 'Error' state that you listen for.
        emit(ProfileError(message: e.toString()));

        // Important: After showing the error, you might want to re-emit
        // the loaded state so the UI stays stable.
        emit(ProfileLoaded(profile: oldProfile));
      }
    }
  }

  Future<void> _unfollowUser(
    UnfollowUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      //Keep a copy of the old profile in case of failure
      final oldProfile = currentState.profile;

      final updatedProfile = oldProfile.copyWith(
        isFollowing: false,
        followersCount: oldProfile.followersCount > 0
            ? oldProfile.followersCount - 1
            : 0,
      );
      emit(ProfileLoaded(profile: updatedProfile));

      try {
        await unfollowUserUsecase(event.userId);
      } catch (e) {
        emit(ProfileLoaded(profile: oldProfile));
        emit(ProfileError(message: e.toString()));
        emit(ProfileLoaded(profile: oldProfile));
      }
    }
  }
}
