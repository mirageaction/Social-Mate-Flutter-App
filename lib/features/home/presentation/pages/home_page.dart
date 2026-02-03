import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/home/presentation/bloc/story_bloc.dart';
import 'package:social_mate_app/features/home/presentation/views/home_app_bar.dart';
import 'package:social_mate_app/features/home/presentation/views/post_writing_card.dart';
import 'package:social_mate_app/features/home/presentation/views/stories_section.dart';

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