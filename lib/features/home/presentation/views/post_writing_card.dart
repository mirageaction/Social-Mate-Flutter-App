import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';
import 'package:social_mate_app/global/widgets/svg_icon.dart';

class PostWritingCard extends StatelessWidget {
  const PostWritingCard({
    super.key,
    required this.colorScheme,
    required this.textTheme,
  });

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        padding: EdgeInsets.zero,
        color: colorScheme.secondary,
        radius: Radius.circular(12.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withValues(alpha: 0.07),
              colorScheme.primary.withValues(alpha: 0.03),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ShimmerAvatar(
                  size: 40.w,
                  imageUrl:
                      'https://avatars.githubusercontent.com/u/87110578?v=4',
                ),
                16.horizontalSpace,
                Shimmer.fromColors(
                  baseColor: colorScheme.onSurfaceVariant,
                  period: const Duration(seconds: 2),
                  highlightColor: colorScheme.onSurface,
                  child: Text(
                    'What\'s on your mind?',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.w,
                children: [
                  _PostWritingCardActions(
                    path: Assets.icons.image.path,
                    label: 'Image',
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                  _PostWritingCardActions(
                    path: Assets.icons.videos.path,
                    label: 'Videos',
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                  _PostWritingCardActions(
                    path: Assets.icons.attach.path,
                    label: 'Attach',
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostWritingCardActions extends StatelessWidget {
  final String path;
  final String label;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final bool? isLast;
  final VoidCallback? onTap;

  const _PostWritingCardActions({
    required this.path,
    required this.label,
    required this.colorScheme,
    required this.textTheme,
    this.onTap,
    this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Row(
        children: [
          SvgIcon(path: path, size: 24.w, color: colorScheme.secondary),
          4.horizontalSpace,
          Text(
            '$label ${isLast == true ? '' : '| '}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
