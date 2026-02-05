import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/home/presentation/bloc/story_bloc.dart';
import 'package:social_mate_app/features/home/presentation/views/add_story_item.dart';
import 'package:social_mate_app/features/home/presentation/views/shimmer_stories.dart';
import 'package:social_mate_app/features/home/presentation/views/story_item.dart';
import 'package:social_mate_app/features/story_viewer/presentation/bloc/story_viewer_bloc.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryBloc, StoryState>(
      listenWhen: (previous, current) => current is StoryError,
      listener: (context, state) {
        if (state is StoryError) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is StoryLoading ||
          current is StoryLoaded ||
          current is StoryError,
      builder: (context, state) {
        if (state is StoryLoading) {
          return const ShimmerStories();
        }
        if (state is StoryError) {
          return const SizedBox.shrink();
        }
        if (state is StoryLoaded) {
          final stories = state.stories;

          return SizedBox(
            height: 95.h,
            child: BlocListener<StoryViewerBloc, StoryViewerState>(
              listenWhen: (previous, current) => current is StoryViewerLoaded,
              listener: (context, state) {
                if (state is StoryViewerLoaded) {
                  context.push(AppPaths.storyViewer, extra: state.stories);
                }
              },
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: stories.length + 1,
                clipBehavior: Clip.none,
                separatorBuilder: (context, index) => 12.horizontalSpace,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const AddStoryItem();
                  }
                  final story = stories[index - 1];
                  return BlocBuilder<StoryViewerBloc, StoryViewerState>(
                    builder: (context, state) {
                      bool isLoading =
                          state is StoryViewerLoading &&
                          state.activeAuthorId == story.authorId;
                      return StoryItem(
                        type: story.type,
                        imageUrl: story.mediaUrl, 
                        name: story.name,
                        text: story.content,
                        isLoading: isLoading,
                        bgColor: Color(int.parse(story.bgColor)),
                        onTap: () {
                          context.read<StoryViewerBloc>().add(
                            GetAuthorStoriesEvent(authorId: story.authorId),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
