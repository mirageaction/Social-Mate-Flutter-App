import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_display/number_display.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/discover_people/presentation/bloc/discover_people_bloc.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class DiscoverPeopleItem extends StatelessWidget {
  const DiscoverPeopleItem({super.key, required this.user});

  final ProfileEntity user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final strings = AppStrings.of(context);
    final numberFormatter = createDisplay(
      decimal: 1,
      separator: ',',
      length: 5,
    );

    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colorScheme.outline, width: 1.w),
      ),
      child: Row(
        children: [
          ShimmerAvatar(size: 50.w, imageUrl: user.avatarUrl ?? ''),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '${numberFormatter(user.followersCount)} ${strings.followers.toLowerCase()}',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          _FollowButton(colorScheme: colorScheme, strings: strings, user: user),
        ],
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  const _FollowButton({
    required this.colorScheme,
    required this.strings,
    required this.user,
  });

  final ProfileEntity user;
  final ColorScheme colorScheme;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscoverPeopleBloc, DiscoverPeopleState>(
      listenWhen: (previous, current) {
        return current is DiscoverPeopleError;
      },
      listener: (context, state) {
        if (state is DiscoverPeopleError) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      buildWhen: (previous, current) {
        // Only rebuild if it's the same user being updated in the list
        // Since we are rebuilding the whole list on Loaded state, we might not need complex checks here
        // BUT if we want to optimize, we can check if THIS user changed.
        // However, since we get a new List<User>, checking equality might be tricky if reference changed.
        // For safest approach with immutable lists: just rebuild.
        return current is DiscoverPeopleLoaded;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (user.isFollowing) {
              context.read<DiscoverPeopleBloc>().add(
                UnfollowUserEvent(user.id),
              );
            } else {
              context.read<DiscoverPeopleBloc>().add(FollowUserEvent(user.id));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: user.isFollowing
                ? Colors.transparent
                : colorScheme.primary,
            foregroundColor: user.isFollowing
                ? Colors.grey
                : colorScheme.onPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: user.isFollowing
                  ? BorderSide(color: colorScheme.outline)
                  : BorderSide.none,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          ),
          child: Text(user.isFollowing ? strings.unfollow : strings.follow),
        );
      },
    );
  }
}
