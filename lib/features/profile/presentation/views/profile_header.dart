import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/presentation/views/profile_cover.dart';
import 'package:social_mate_app/features/profile/presentation/views/profile_picture.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProfileCover(profile: profile),
        Positioned(
          bottom: -60.w,
          left: 0,
          right: 0,
          child: ProfilePicture(profile: profile),
        ),
      ],
    );
  }
}