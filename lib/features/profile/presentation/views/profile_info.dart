import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          profile.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        6.verticalSpace,
        if (profile.username != null)
          Text(
            profile.username!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
        2.verticalSpace,
        if (profile.bio != null)
          Text(
            profile.bio!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
      ],
    );
  }
}
