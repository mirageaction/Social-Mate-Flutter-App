import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/global/data/models/user_model.dart';

class StoryModel extends StoryEntity {
  const StoryModel({
    required super.id,
    required super.authorId,
    required super.mediaUrl,
    required super.name,
    required super.bgColor,
    required super.content,
    required super.type,
    required super.createdAt,
    required super.expiresAt,
    required super.user,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id']?.toString() ?? '',
      authorId: json['author_id']?.toString() ?? '',
      mediaUrl: json['media_url'] ?? '',
      name: json['users']?['name'] ?? '',
      bgColor: json['bg_color']?.toString() ?? '0',
      content: json['content'] ?? '',
      type: json['type'] ?? '',
      createdAt: json['created_at'] ?? '',
      expiresAt: json['expires_at'] ?? '',
      user: UserModel.fromJson(json['users'] ?? {}),
    );
  }
}
