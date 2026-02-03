import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable {
  final String id;
  final String createdAt;
  final String authorId;
  final String imageUrl;
  final String name;

  const StoryEntity({
    required this.id,
    required this.createdAt,
    required this.authorId,
    required this.imageUrl,
    required this.name,
  });

  @override
  List<Object?> get props => [id, createdAt, authorId, imageUrl, name];
}
