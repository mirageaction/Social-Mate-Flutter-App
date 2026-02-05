import 'package:equatable/equatable.dart';
import 'package:social_mate_app/global/domain/entities/user_entity.dart';

class StoryEntity extends Equatable {
  final String id;
  final String createdAt;
  final String authorId;
  final String mediaUrl;
  final String name;
  final String content;
  final String bgColor;
  final String type;
  final String expiresAt;
  final UserEntity user;

  const StoryEntity({
    required this.id,
    required this.createdAt,
    required this.authorId,
    required this.mediaUrl,
    required this.name,
    required this.content,
    required this.bgColor,
    required this.type, 
    required this.expiresAt,
    required this.user,
  });

  @override
  List<Object?> get props => [id, createdAt, authorId, mediaUrl, name, content, bgColor, type, expiresAt, user];
}
