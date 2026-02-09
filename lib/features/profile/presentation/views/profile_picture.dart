import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/global/widgets/svg_icon.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onLongPress: () {
        context.read<AuthBloc>().add(SignOutEvent());
        context.go(AppPaths.auth);
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        alignment: Alignment.center,
        decoration: isError
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.secondary, width: 4.w),
              ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: widget.profile.avatarUrl!,
            height: 124.w,
            width: 124.w,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorListener: (error) {
              if (mounted) {
                setState(() {
                  isError = true;
                });
              }
            },
            errorWidget: (context, url, error) => Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withValues(alpha: 0.9),
              ),
              child: SvgIcon(
                path: Assets.icons.person.path,
                size: 122.w,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
