part of 'story_bg_controller_cubit.dart';

sealed class StoryBgControllerState extends Equatable {
  const StoryBgControllerState();

  @override
  List<Object> get props => [];
}

final class StoryBgControllerInitial extends StoryBgControllerState {}

final class StoryBgControllerSelected extends StoryBgControllerState {
  final Color color;
  const StoryBgControllerSelected({required this.color});
  @override
  List<Object> get props => [color];
}
