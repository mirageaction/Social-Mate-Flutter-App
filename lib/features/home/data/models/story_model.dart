import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  const StoryModel({
    required super.id,
    required super.createdAt,
    required super.authorId,
    required super.imageUrl,
    required super.name,
  });



   factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] ?? '',
      createdAt: json['created_at'] ?? '',
      authorId: json['author_id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      // Extract name from the joined 'users' object
      name: json['users']?['name'] ?? json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'author_id': authorId,
      'image_url': imageUrl,
      'name': name,
    };
  }
}