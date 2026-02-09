import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';

class ShimmerPeople extends StatelessWidget {
  const ShimmerPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: ListTile(
            leading: ShimmerBox(width: 50.w, height: 50.h, borderRadius: 25.r),
            title: ShimmerBox(width: 100.w, height: 20.h, borderRadius: 10.r),
            subtitle: ShimmerBox(width: 150.w, height: 15.h, borderRadius: 7.r),
            trailing: ShimmerBox(width: 80.w, height: 35.h, borderRadius: 8.r),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
            ),
          ),
        );
      },
    );
  }
}
