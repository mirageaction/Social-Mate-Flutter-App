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
  });

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
  ];
}
