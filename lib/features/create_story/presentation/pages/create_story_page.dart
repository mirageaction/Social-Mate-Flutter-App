import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/features/create_story/presentation/bloc/gallery_bloc.dart';
import 'package:social_mate_app/features/create_story/presentation/views/create_story_appbar.dart';
import 'package:social_mate_app/features/create_story/presentation/views/photos_grid.dart';
import 'package:social_mate_app/features/create_story/presentation/views/story_type_selector.dart';

class CreateStoryPage extends StatefulWidget {
  const CreateStoryPage({super.key});

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<GalleryBloc>().add(GetPhotosEvent());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final strings = AppStrings.of(context);

    return Scaffold(
      appBar: CreateStoryAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.verticalSpace,
            StoryTypeSelector(strings: strings),
            16.verticalSpace,
            Divider(color: colorScheme.outline, thickness: 2.h),
            16.verticalSpace,
            const PhotosGrid(),
          ],
        ),
      ),
    );
  }
}
