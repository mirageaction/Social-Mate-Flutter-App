import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/enums/post_type.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/media_picker_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview({super.key});

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  VideoPlayerController? _controller;
  File? _currentFile;

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    _controller?.dispose();
    super.dispose();
  }

  void _listener() {
    if (mounted) {
      setState(() {});
    }
  }

  void _initializeController(File file) {
    if (_currentFile?.path == file.path) return;

    _controller?.removeListener(_listener);
    _controller?.dispose();
    _currentFile = file;
    _controller = VideoPlayerController.file(file)
      ..initialize().then((_) {
        if (mounted) {
          _controller?.addListener(_listener);
          setState(() {});
        }
      });
  }

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
        if (state is MediaPickerLoading) {
          return SizedBox(
            height: 200.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is MediaPickerSuccess && state.file != null) {
          _initializeController(state.file!);

          if (_controller == null || !_controller!.value.isInitialized) {
            return SizedBox(
              height: 200.h,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    ),
                    // Play/Pause Overlay
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _controller!.value.isPlaying
                              ? _controller!.pause()
                              : _controller!.play();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _controller!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 40.w,
                        ),
                      ),
                    ),
                    // Delete Button
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
                            const ClearMediaEvent(type: PostType.video),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Visibility(
                visible: false,
                child: VideoProgressIndicator(
                  _controller!,
                  allowScrubbing: true,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  colors: VideoProgressColors(
                    playedColor: colorScheme.primary,
                    bufferedColor: colorScheme.primary.withValues(alpha: 0.2),
                    backgroundColor: colorScheme.surface,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
