import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String? email;
  final String? bio;
  final String? phone;
  final String? username;
  final String? avatarUrl;
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final int photosCount;
  final bool isFollowing;

  const ProfileEntity({
    required this.id,
    required this.name,
    this.email,
    this.bio,
    this.phone,
    this.username,
    this.avatarUrl,
    this.followersCount = 0,
    this.followingCount = 0,
    this.postsCount = 0,
    this.photosCount = 0,
    this.isFollowing = false,
  });

  ProfileEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? bio,
    String? phone,
    String? username,
    String? avatarUrl,
    int? followersCount,
    int? followingCount,
    int? postsCount,
    int? photosCount,
    bool? isFollowing,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      postsCount: postsCount ?? this.postsCount,
      photosCount: photosCount ?? this.photosCount,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    bio,
    phone,
    username,
    avatarUrl,
    followersCount,
    followingCount,
    postsCount,
    photosCount,
    isFollowing,
  ];
}
