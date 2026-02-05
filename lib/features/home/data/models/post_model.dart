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
    required super.user,
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
      likesCount: json['likes'] ?? [],
      user: UserModel.fromJson(json['users'] ?? {}),
    );
  }
}
