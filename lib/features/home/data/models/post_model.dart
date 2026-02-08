import 'package:social_mate_app/core/enums/post_type.dart';
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
    super.postType,
  });

  factory PostModel.fromJson(
    Map<String, dynamic> json, {
    String? currentAuthorId,
  }) {
    // Logic to check if the current user is in the list of likes/dislikes
    final List postLikes = json['is_liked'] ?? [];
    final List postDislikes = json['is_disliked'] ?? [];

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
      isLiked: postLikes.any((like) => like['author_id'] == currentAuthorId),
      isDisliked: postDislikes.any(
        (dislike) => dislike['author_id'] == currentAuthorId,
      ),
      user: UserModel.fromJson(json['users'] ?? {}),
      postType: json['post_type'] != null
          ? PostType.values.byName(json['post_type'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'media_url': mediaUrl,
      'author_id': authorId,
      'name': name,
      'avatar': avatar,
      'created_at': createdAt.toIso8601String(),
      'likes': likesCount,
      'dislikes': dislikesCount,
      'comments_count': commentsCount,
      'is_liked': isLiked,
      'is_disliked': isDisliked,
      'users': (user as UserModel).toJson(),
      'post_type': postType?.name,
    };
  }

  @override
  PostModel copyWith({
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
    dynamic user,
    PostType? postType,
  }) {
    return PostModel(
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
      postType: postType ?? this.postType,
    );
  }
}
