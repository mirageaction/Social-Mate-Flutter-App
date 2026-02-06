import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/home/presentation/views/add_story_item.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';

class ShimmerStories extends StatelessWidget {
  const ShimmerStories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount: 10,
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const AddStoryItem();
          }
          return Column(
            children: [
              ShimmerBox(height: 55.w, width: 55.w, borderRadius: 100),
              12.verticalSpace,
              ShimmerBox(height: 12.h, width: 55.w),
            ],
          );
        },
      ),
    );
  }
}
