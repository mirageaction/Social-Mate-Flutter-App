import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';

class CreateStoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateStoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => context.pop(),
            child: Icon(Icons.close, size: 27.w),
          ),
          16.horizontalSpace,
          Text(AppStrings.of(context).createStory),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}