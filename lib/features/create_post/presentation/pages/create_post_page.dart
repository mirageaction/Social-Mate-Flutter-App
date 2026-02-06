import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/features/create_post/presentation/views/create_post_appbar.dart';
import 'package:social_mate_app/features/create_post/presentation/views/draggable_post_sheet.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final strings = AppStrings.of(context);

    return Scaffold(
      appBar: CreatePostAppBar(textTheme: textTheme, colorScheme: colorScheme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            Row(
              children: [
                ShimmerAvatar(size: 40.w, imageUrl: ''),
                10.horizontalSpace,
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.w,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          strings.public,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        4.horizontalSpace,
                        Icon(
                          Icons.arrow_drop_down,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            TextField(
              maxLines: null,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: strings.whatsOnYourMind,
                hintStyle: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCreatePostSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
