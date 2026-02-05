import 'package:equatable/equatable.dart';
import 'package:social_mate_app/global/domain/entities/user_entity.dart';

class PostEntity extends Equatable {
  final String id;
  final String content;
  final String mediaUrl;
  final String authorId;
  final String name;
  final String avatar;
  final DateTime createdAt;
  final List<String> likesCount;
  final UserEntity user;

  const PostEntity({
    required this.id,
    required this.content,
    required this.mediaUrl,
    required this.authorId,
    required this.name,
    required this.avatar,
    required this.createdAt,
    required this.likesCount,
    required this.user,
  });

  @override
  List<Object?> get props => [
    id,
    content,
    mediaUrl,
    authorId,
    name,
    avatar,
    createdAt,
    likesCount,
    user,
  ];
}