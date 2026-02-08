import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/enums/post_type.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/media_picker_bloc.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key});

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
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
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
                              const ClearMediaEvent(
                                type: PostType.image,
                              ),
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
