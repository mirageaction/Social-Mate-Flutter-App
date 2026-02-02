import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SizedBox(
      height: 95.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 10,
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const AddStoryItem();
          }
          return StoryItem(
            imageUrl: 'https://avatars.githubusercontent.com/u/87110578?v=4',
            name: 'Story $index',
            hasUpdate: index % 3 == 0,
          );
        },
      ),
    );
  }
}
