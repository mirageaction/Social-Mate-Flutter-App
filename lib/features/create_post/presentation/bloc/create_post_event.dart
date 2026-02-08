part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object?> get props => [];
}

class SubmitPostEvent extends CreatePostEvent {
  final String content;
  final File? media;
  final PostType postType;

  const SubmitPostEvent({
    required this.content,
    this.media,
    required this.postType,
  });

  @override
  List<Object?> get props => [content, media, postType];
}
