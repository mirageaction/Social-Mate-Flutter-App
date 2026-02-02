import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/widgets/svg_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Assets.images.appLogoWithoutSearch.image(height: 27.w),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgIcon(
            path: Assets.icons.search.path,
            size: 24.w,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgIcon(
            path: Assets.icons.bellRinging.path,
            size: 24.w,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgIcon(
            path: Assets.icons.send.path,
            size: 24.w,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
