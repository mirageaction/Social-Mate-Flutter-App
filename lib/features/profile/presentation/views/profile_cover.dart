import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/global/widgets/svg_icon.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
      child: CachedNetworkImage(
        imageUrl: profile.avatarUrl!,
        height: 0.40.sh,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorWidget: (context, url, error) => Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16.h,
            bottom: 16.h,
          ),
          decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.3)),
          child: SvgIcon(
            path: Assets.icons.person.path,
            size: 0.25.sh,
            color: Colors.grey.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}