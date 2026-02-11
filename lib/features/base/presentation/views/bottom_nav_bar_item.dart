import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.colorScheme,
    required this.icon,
    this.isSelected = false,
  });

  final ColorScheme colorScheme;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colorScheme.primary.withValues(alpha: 0.1),
            )
          : null,
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
          BlendMode.srcIn,
        ),
        width: 24.w,
        height: 24.w,
      ),
    );
  }
}