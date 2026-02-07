import 'dart:io';
import 'package:social_mate_app/core/enums/post_media_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/create_post_bloc.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/media_picker_bloc.dart';
import 'package:social_mate_app/features/create_post/presentation/views/create_post_appbar.dart';
import 'package:social_mate_app/features/create_post/presentation/views/documet_preview.dart';
import 'package:social_mate_app/features/create_post/presentation/views/post_picker_sheet.dart';
import 'package:social_mate_app/features/create_post/presentation/views/image_preview.dart';
import 'package:social_mate_app/features/create_post/presentation/views/post_text_field.dart';
import 'package:social_mate_app/features/create_post/presentation/views/privacy_selector.dart';
import 'package:social_mate_app/features/create_post/presentation/views/video_preview.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _onPost() {
    final mediaState = context.read<MediaPickerBloc>().state;
    File? media;
    PostMediaType mediaType = PostMediaType.image;

    if (mediaState is MediaPickerSuccess) {
      media = mediaState.file;
      // Map MediaPickerType to PostMediaType
      switch (mediaState.type) {
        case MediaPickerType.image:
          mediaType = PostMediaType.image;
          break;
        case MediaPickerType.video:
          mediaType = PostMediaType.video;
          break;
        case MediaPickerType.file:
          mediaType = PostMediaType.file;
          break;
        default:
          mediaType = PostMediaType.image;
      }
    }

    context.read<CreatePostBloc>().add(
      SubmitPostEvent(
        content: _contentController.text,
        media: media,
        mediaType: mediaType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostLoading) {
          getIt<ToastService>().showInfoToast(
            context: context,
            message: 'Creating post...',
          );
        } else if (state is CreatePostSuccess) {
          getIt<ToastService>().showSuccessToast(
            context: context,
            message: 'Post created successfully!',
          );
          context.pop();
        } else if (state is CreatePostFailure) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      child: Scaffold(
        appBar: CreatePostAppBar(
          textTheme: textTheme,
          colorScheme: colorScheme,
          onPost: _onPost,
        ),
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
                    const PrivacySelector(),
                  ],
                ),
                16.verticalSpace,
                PostTextField(controller: _contentController),
                30.verticalSpace,
                BlocSelector<
                  MediaPickerBloc,
                  MediaPickerState,
                  MediaPickerType
                >(
                  selector: (state) {
                    return state.type;
                  },
                  builder: (context, state) {
                    switch (state) {
                      case MediaPickerType.image:
                        return const ImagePreview();
                      case MediaPickerType.video:
                        return const VideoPreview();
                      case MediaPickerType.file:
                        return const DocumentPreview();
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
                50.verticalSpace,
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showCreatePostSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
