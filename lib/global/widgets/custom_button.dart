import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return MaterialButton(
      height: 60.h,
      minWidth: 1.sw,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      onPressed: isLoading ? () {} : onPressed,
      color: backgroundColor ?? colorScheme.primary,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: backgroundColor == null
                    ? colorScheme.onPrimary
                    : colorScheme.primary,
              ),
            ),
    );
  }
}
