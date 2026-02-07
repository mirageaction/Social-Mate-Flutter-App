import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/create_post_bloc.dart';

class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreatePostAppBar({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.onPost,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final VoidCallback onPost;

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.close, color: colorScheme.onSurface, size: 24.w),
          ),
          Text(strings.createPost),
          BlocBuilder<CreatePostBloc, CreatePostState>(
            builder: (context, state) {
              if (state is CreatePostLoading) {
                return SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                );
              }
              return TextButton(
                onPressed: onPost,
                child: Text(strings.post, style: textTheme.titleMedium),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
