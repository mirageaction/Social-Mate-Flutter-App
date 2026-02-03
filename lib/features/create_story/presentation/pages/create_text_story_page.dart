import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/create_story/presentation/cubit/story_bg_controller_cubit.dart';
import 'package:social_mate_app/features/create_story/presentation/views/colors_selector.dart';
import 'package:social_mate_app/features/create_story/presentation/views/create_text_story_appbar.dart';
import 'package:social_mate_app/features/create_story/presentation/views/story_text_content.dart';

class CreateTextStoryPage extends StatelessWidget {
  const CreateTextStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<StoryBgControllerCubit, Color>(
      builder: (context, color) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(systemNavigationBarColor: color),
          child: Scaffold(
            backgroundColor: color,
            appBar: CreateTextStoryAppBar(color: color),
            body: StoryTextContent(
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 30.h,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
              ),
              child: ColorsSelector(selectedIndex: 2),
            ),
          ),
        );
      },
    );
  }
}
