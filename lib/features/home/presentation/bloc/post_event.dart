part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class GetPostsEvent extends PostEvent {}

class ToggleLikeEvent extends PostEvent {
  final String postId;
  const ToggleLikeEvent(this.postId);

  @override
  List<Object> get props => [postId];
}

class ToggleDislikeEvent extends PostEvent {
  final String postId;
  const ToggleDislikeEvent(this.postId);

  @override
  List<Object> get props => [postId];
}


final class GetAuthorPostsEvent extends PostEvent {
  final String? userId;
  const GetAuthorPostsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}