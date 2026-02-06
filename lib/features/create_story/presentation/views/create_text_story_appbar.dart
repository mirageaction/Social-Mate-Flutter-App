import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateTextStoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CreateTextStoryAppBar({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: color,
      surfaceTintColor: color,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close, color: colorScheme.onPrimary, size: 24.w),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
