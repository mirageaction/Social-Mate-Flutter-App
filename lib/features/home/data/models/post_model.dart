import 'package:social_mate_app/core/enums/post_media_type.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/global/data/models/user_model.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.content,
    required super.mediaUrl,
    required super.authorId,
    required super.name,
    required super.avatar,
    required super.createdAt,
    required super.likesCount,
    super.dislikesCount = 0,
    super.commentsCount = 0,
    super.isLiked = false,
    super.isDisliked = false,
    required super.user,
    super.mediaType,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      mediaUrl: json['media_url'] ?? '',
      authorId: json['author_id'] ?? '',
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      likesCount: json['likes'] ?? 0,
      dislikesCount: json['dislikes'] ?? 0,
      commentsCount: json['comments_count'] ?? 0,
      isLiked: json['is_liked'] ?? false,
      isDisliked: json['is_disliked'] ?? false,
      user: UserModel.fromJson(json['users'] ?? {}),
      mediaType: json['media_type'] != null
          ? PostMediaType.values.byName(json['media_type'])
          : null,
    );
  }
}
