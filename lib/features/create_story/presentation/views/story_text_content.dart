import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/create_story/presentation/cubit/story_bg_controller_cubit.dart';

class StoryTextContent extends StatelessWidget {
  const StoryTextContent({
    super.key,
    required this.colorScheme,
    required this.textTheme,
  });

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBgControllerCubit, Color>(
      builder: (context, color) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: color,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Theme(
            data: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: colorScheme.onPrimary,
                selectionColor: colorScheme.onPrimary.withValues(alpha: 0.2),
                selectionHandleColor: colorScheme.onPrimary,
              ),
            ),
            child: TextField(
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimary,
              ),
              decoration: InputDecoration(
                hintText: 'Write your thought with others',
                hintStyle: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onPrimary.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
