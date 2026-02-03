import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/widgets/svg_icon.dart';

class StoryTypeButton extends StatelessWidget {
  const StoryTypeButton({
    super.key,
    required this.title,
    required this.path,
    required this.onTap,
  });
  final String title;
  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(path: path, size: 35.w, color: colorScheme.primary),
            4.verticalSpace,
            Text(title, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}