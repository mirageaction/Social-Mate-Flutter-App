import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/media_picker_bloc.dart';
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
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
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
                    excludeFromSemantics: true,
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
              AnimatedTextField(
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
              ),
              30.verticalSpace,
              const MediaPreview(),
              50.verticalSpace,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCreatePostSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MediaPreview extends StatelessWidget {
  const MediaPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<MediaPickerBloc, MediaPickerState>(
      listener: (context, state) {
        if (state is MediaPickerError) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is MediaPickerSuccess && current.file != null ||
          current is MediaPickerError ||
          current is MediaPickerInitial,
      builder: (context, state) {
        if (state is MediaPickerSuccess && state.file != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.file(
              state.file!,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              // DECLARATIVE approach: No setState needed
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                // If it's ready (sync) or frame is 0, show the full UI
                if (wasSynchronouslyLoaded || frame != null) {
                  return Stack(
                    children: [
                      child, // The Image itself
                      Positioned(
                        top: 10.w,
                        right: 10.w,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: colorScheme.surface.withValues(
                              alpha: 0.9,
                            ),
                            foregroundColor: colorScheme.error,
                            elevation: 4,
                            shadowColor: Colors.black.withValues(alpha: 0.2),
                          ),
                          icon: Icon(Icons.delete_outline, size: 24.w),
                          onPressed: () {
                            context.read<MediaPickerBloc>().add(
                              const ClearMediaEvent(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

                // Show loader while the frame is null
                return SizedBox(
                  height: 200.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.primary,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
