import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';

class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreatePostAppBar({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close, color: colorScheme.onSurface, size: 24.w),
          ),
          Text(strings.createPost),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(strings.post, style: textTheme.titleMedium),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
