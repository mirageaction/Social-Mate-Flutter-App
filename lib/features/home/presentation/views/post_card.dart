import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:number_display/number_display.dart';
import 'package:readmore/readmore.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/home/domain/entities/post_entity.dart';
import 'package:social_mate_app/features/widgets/shimmer_avater.dart';
import 'package:social_mate_app/features/widgets/shimmer_image.dart';
import 'package:social_mate_app/features/widgets/svg_icon.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final icons = Assets.icons;

    final formatNumber = createDisplay(length: 5, decimal: 1, separator: ',');
    final formatTime = GetTimeAgo.parse(post.createdAt);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ShimmerAvatar(size: 40.w, imageUrl: post.user.avatarUrl),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.user.name, style: textTheme.titleMedium),
                  2.verticalSpace,
                  Text(
                    formatTime,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          12.verticalSpace,
          ReadMoreText(
            post.content,
            trimMode: TrimMode.Line,
            trimLines: 3,
            trimCollapsedText: 'Read More',
            trimExpandedText: 'Read Less',
            moreStyle: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
            ),
            style: textTheme.bodyMedium,
          ),
          12.verticalSpace,
          ShimmerImage(
            width: double.infinity,
            height: 200.h,
            imageUrl: post.mediaUrl,
            borderRadius: 12.r,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
          12.verticalSpace,
          Row(
            children: [
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: SvgIcon(
                  path: icons.thumbsUp.path,
                  size: 24.w,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              2.horizontalSpace,
              Text(
                formatNumber(100000),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              12.horizontalSpace,
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: SvgIcon(
                  path: icons.chatCircleDots.path,
                  size: 24.w,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              2.horizontalSpace,
              Text(
                formatNumber(1300),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              12.horizontalSpace,
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: SvgIcon(
                  path: icons.share.path,
                  size: 24.w,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                visualDensity: VisualDensity.compact,
                icon: SvgIcon(
                  path: icons.bookmark.path,
                  size: 24.w,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
