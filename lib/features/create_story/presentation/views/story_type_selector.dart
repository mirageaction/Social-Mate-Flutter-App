import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/create_story/presentation/views/story_type_button.dart';

class StoryTypeSelector extends StatelessWidget {
  const StoryTypeSelector({super.key, required this.strings});
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StoryTypeButton(
          title: strings.textStory,
          path: Assets.icons.font.path,
          onTap: () {
            context.push(AppPaths.createTextStory);
          },
        ),
        StoryTypeButton(
          title: strings.camera,
          path: Assets.icons.cameraFocus.path,
          onTap: () {},
        ),
        StoryTypeButton(
          title: strings.music,
          path: Assets.icons.music.path,
          onTap: () {},
        ),
      ],
    );
  }
}
