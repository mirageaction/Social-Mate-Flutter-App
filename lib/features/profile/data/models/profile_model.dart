import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    super.email,
    super.bio,
    super.phone,
    super.username,
    super.avatarUrl,
    super.isFollowing,
    super.followersCount,
    super.followingCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json, String userId) {
    final follows = json['follows'] as List?;
    final isFollowing =
        follows?.any((f) => f['follower_id'] == userId) ?? false;

    return ProfileModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      bio: json['bio'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      isFollowing: isFollowing,
      followersCount: json['followers_count'] ?? 0,
      followingCount: json['following_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'bio': bio,
      'phone': phone,
      'username': username,
      'avatarUrl': avatarUrl,
    };
  }
}
