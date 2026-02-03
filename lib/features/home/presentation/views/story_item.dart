import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/widgets/shimmer_image.dart';

class StoryItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool hasUpdate;

  const StoryItem({
    super.key,
    required this.imageUrl,
    required this.name,
    this.hasUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DottedBorder(
          options: CircularDottedBorderOptions(
            strokeWidth: 2,
            padding: EdgeInsets.zero,
            color: colorScheme.secondary,
          ),
          child: ShimmerImage(size: 56.w, imageUrl: imageUrl),
        ),
        8.verticalSpace,
        SizedBox(
          width: 60.w,
          child: Text(
            name,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
