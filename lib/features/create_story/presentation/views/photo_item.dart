import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:social_mate_app/features/widgets/shimmer_box.dart';

class PhotoItem extends StatelessWidget {
  final AssetEntity photo;
  const PhotoItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: AssetEntityImage(
        photo,
        isOriginal: false,
        width: 100.w,
        height: 170.h,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame == null) {
            return ShimmerBox(height: 170.h, width: 100.w);
          }
          return child;
        },
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}


