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

class DiscoverPeopleItem extends StatefulWidget {
  const DiscoverPeopleItem({super.key, required this.user});

  final ProfileEntity user;

  @override
  State<DiscoverPeopleItem> createState() => _DiscoverPeopleItemState();
}

class _DiscoverPeopleItemState extends State<DiscoverPeopleItem> {
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
          ShimmerAvatar(size: 50.w, imageUrl: widget.user.avatarUrl ?? ''),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                BlocBuilder<DiscoverPeopleBloc, DiscoverPeopleState>(
                  buildWhen: (previous, current) {
                    return current is DiscoverPeopleFollowed ||
                        current is DiscoverPeopleUnfollowed;
                  },
                  builder: (context, state) {
                    int followersCount = widget.user.followersCount;
                    if (state is DiscoverPeopleFollowed &&
                        state.userId == widget.user.id) {
                      followersCount++;
                    } else if (state is DiscoverPeopleUnfollowed &&
                        state.userId == widget.user.id) {
                      followersCount > 0 ? followersCount-- : 0;
                    }
                    return Text(
                      '${numberFormatter(followersCount)} ${strings.followers.toLowerCase()}',
                      style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    );
                  },
                ),
              ],
            ),
          ),
          _FollowButton(
            widget: widget,
            colorScheme: colorScheme,
            strings: strings,
          ),
        ],
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  const _FollowButton({
    required this.widget,
    required this.colorScheme,
    required this.strings,
  });

  final DiscoverPeopleItem widget;
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
        return current is DiscoverPeopleFollowed ||
            current is DiscoverPeopleUnfollowed;
      },
      builder: (context, state) {
        bool isFollowing = widget.user.isFollowing;
        if (state is DiscoverPeopleFollowed && state.userId == widget.user.id) {
          isFollowing = true;
        } else if (state is DiscoverPeopleUnfollowed &&
            state.userId == widget.user.id) {
          isFollowing = false;
        }
        return ElevatedButton(
          onPressed: () {
            if (isFollowing) {
              context.read<DiscoverPeopleBloc>().add(
                UnfollowUserEvent(widget.user.id),
              );
            } else {
              context.read<DiscoverPeopleBloc>().add(
                FollowUserEvent(widget.user.id),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isFollowing
                ? Colors.transparent
                : colorScheme.primary,
            foregroundColor: isFollowing ? Colors.grey : colorScheme.onPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: isFollowing
                  ? BorderSide(color: colorScheme.outline)
                  : BorderSide.none,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          ),
          child: Text(isFollowing ? strings.unfollow : strings.follow),
        );
      },
    );
  }
}
