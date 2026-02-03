import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/widgets/shimmer_box.dart';

class ShimmerPhotos extends StatelessWidget {
  const ShimmerPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 170.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ShimmerBox(height: 170.h, width: 100.w);
        },
      ),
    );
  }
}