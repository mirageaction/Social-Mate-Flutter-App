part of 'story_viewer_bloc.dart';

sealed class StoryViewerEvent extends Equatable {
  const StoryViewerEvent();

  @override
  List<Object> get props => [];
}

class GetAuthorStoriesEvent extends StoryViewerEvent {
  final String authorId;
  const GetAuthorStoriesEvent({required this.authorId});
  @override
  List<Object> get props => [authorId];
}