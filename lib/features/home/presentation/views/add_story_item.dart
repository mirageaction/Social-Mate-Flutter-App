import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/widgets/svg_icon.dart';

class AddStoryItem extends StatelessWidget {
  const AddStoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DottedBorder(
          options: CircularDottedBorderOptions(
            strokeWidth: 1.5,
            padding: EdgeInsets.zero,
            color: colorScheme.secondary,
          ),
          child: Container(
            padding: EdgeInsets.all(19.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: 0.1),
            ),
            child: SvgIcon(
              path: Assets.icons.addCircleOutline.path,
              size: 18.w,
              color: colorScheme.secondary,
            ),
          ),
        ),
        8.verticalSpace,
        Text(
          'Share Story',
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

