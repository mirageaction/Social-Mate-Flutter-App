import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/home/presentation/bloc/story_bloc.dart';
import 'package:social_mate_app/features/home/presentation/views/add_story_item.dart';
import 'package:social_mate_app/features/home/presentation/views/home_app_bar.dart';
import 'package:social_mate_app/features/home/presentation/views/post_writing_card.dart';
import 'package:social_mate_app/features/home/presentation/views/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<StoryBloc>().add(GetStoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: HomeAppBar(colorScheme: colorScheme),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: PostWritingCard(
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
            ),
            30.verticalSpace,
            const StoriesSection(),
          ],
        ),
      ),
    );
  }
}

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBloc, StoryState>(
      builder: (context, state) {
        if (state is StoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is StoryError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (state is StoryLoaded) {
          return SizedBox(
            height: 95.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: state.stories.length + 1,
              clipBehavior: Clip.none,
              separatorBuilder: (context, index) => 12.horizontalSpace,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const AddStoryItem();
                }
                return StoryItem(
                  imageUrl: state.stories[index - 1].imageUrl,
                  name: state.stories[index - 1].name,
                  hasUpdate: index % 3 == 0,
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
