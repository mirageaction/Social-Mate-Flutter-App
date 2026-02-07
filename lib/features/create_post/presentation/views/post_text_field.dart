import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/material.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';

class PostTextField extends StatelessWidget {
  final TextEditingController controller;
  const PostTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedTextField(
      controller: controller,
      animationType: Animationtype.typer,
      hintTexts: [
        strings.whatsOnYourMind,
        strings.shareThoughts,
        strings.tellYourStory,
        strings.thinkingAboutToday,
        strings.writeSomething,
      ],
      hintTextStyle: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
      ),
      maxLines: null,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
