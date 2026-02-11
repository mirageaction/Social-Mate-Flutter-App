import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    super.key,
    required this.textTheme,
    required this.profile,
  });

  final TextTheme textTheme;
  final ProfileEntity? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        24.verticalSpace,
        ShimmerAvater(
          size: 128.w,
          onTap: () {
            context.push(AppPaths.profile);
            //_advancedDrawerController.toggleDrawer();
          },
          imageUrl: profile?.avatarUrl ?? '',
        ),
        16.verticalSpace,
        Text(
          profile?.name ?? '',
          style: textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        4.verticalSpace,
        Text(profile?.username ?? '', style: textTheme.bodyMedium),
      ],
    );
  }
}