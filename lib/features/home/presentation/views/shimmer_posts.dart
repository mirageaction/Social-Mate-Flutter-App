import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';

class ShimmerPosts extends StatelessWidget {
  const ShimmerPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) => const _ShimmerPostCard()),
    );
  }
}

class _ShimmerPostCard extends StatelessWidget {
  const _ShimmerPostCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerBox(height: 40.w, width: 40.w, borderRadius: 100),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(height: 20.w, width: 100.w, borderRadius: 100),
                  4.verticalSpace,
                  ShimmerBox(height: 15.w, width: 50.w, borderRadius: 100),
                ],
              ),
            ],
          ),
          12.verticalSpace,
          ShimmerBox(height: 20.w, width: double.infinity, borderRadius: 100),
          12.verticalSpace,
          ShimmerBox(width: double.infinity, height: 200.h, borderRadius: 12.r),
          12.verticalSpace,
          Row(
            children: [
              ShimmerBox(height: 20.w, width: 20.w, borderRadius: 100),
              10.horizontalSpace,
              ShimmerBox(height: 20.w, width: 20.w, borderRadius: 100),
              10.horizontalSpace,
              ShimmerBox(height: 20.w, width: 20.w, borderRadius: 100),
              const Spacer(),
              ShimmerBox(height: 20.w, width: 20.w, borderRadius: 100),
            ],
          ),
        ],
      ),
    );
  }
}
