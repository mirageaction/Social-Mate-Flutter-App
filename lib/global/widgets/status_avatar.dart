import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class StatusAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final bool isOnline;

  const StatusAvatar({
    super.key,
    this.imageUrl,
    this.size = 48,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        ShimmerAvater(size: size.w, imageUrl: imageUrl ?? ''),
        Positioned(
          bottom: 2.w,
          right: 2.w,
          child: Container(
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: isOnline ? Colors.green : Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.surface, width: 2.w),
            ),
          ),
        ),
      ],
    );
  }
}
