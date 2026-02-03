part of 'story_bloc.dart';

sealed class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object> get props => [];
}

final class GetStoriesEvent extends StoryEvent {}
