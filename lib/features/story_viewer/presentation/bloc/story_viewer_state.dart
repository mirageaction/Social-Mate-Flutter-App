part of 'story_viewer_bloc.dart';

sealed class StoryViewerState extends Equatable {
  const StoryViewerState();
  
  @override
  List<Object> get props => [];
}

final class StoryViewerInitial extends StoryViewerState {}


class StoryViewerLoading extends StoryViewerState {
  final String activeAuthorId;
  const StoryViewerLoading(this.activeAuthorId);
}

class StoryViewerLoaded extends StoryViewerState {
  final List<StoryEntity> stories;
  const StoryViewerLoaded({required this.stories});
  @override
  List<Object> get props => [stories];
}

class StoryViewerError extends StoryViewerState {
  final String message;
  const StoryViewerError({required this.message});
  @override
  List<Object> get props => [message];
}
