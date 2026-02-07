import 'package:equatable/equatable.dart';
import 'package:social_mate_app/core/enums/post_media_type.dart';
import 'package:social_mate_app/global/domain/entities/user_entity.dart';

class PostEntity extends Equatable {
  final String id;
  final String content;
  final String mediaUrl;
  final String authorId;
  final String name;
  final String avatar;
  final DateTime createdAt;
  final int likesCount;
  final int dislikesCount;
  final int commentsCount;
  final bool isLiked;
  final bool isDisliked;
  final UserEntity user;
  final PostMediaType? mediaType;

  const PostEntity({
    required this.id,
    required this.content,
    required this.mediaUrl,
    required this.authorId,
    required this.name,
    required this.avatar,
    required this.createdAt,
    required this.likesCount,
    this.dislikesCount = 0,
    this.commentsCount = 0,
    this.isLiked = false,
    this.isDisliked = false,
    required this.user,
    this.mediaType,
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
    dislikesCount,
    commentsCount,
    isLiked,
    isDisliked,
    user,
    mediaType,
  ];

  PostEntity copyWith({
    String? id,
    String? content,
    String? mediaUrl,
    String? authorId,
    String? name,
    String? avatar,
    DateTime? createdAt,
    int? likesCount,
    int? dislikesCount,
    int? commentsCount,
    bool? isLiked,
    bool? isDisliked,
    UserEntity? user,
    PostMediaType? mediaType,
  }) {
    return PostEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      authorId: authorId ?? this.authorId,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      user: user ?? this.user,
      mediaType: mediaType ?? this.mediaType,
    );
  }
}
