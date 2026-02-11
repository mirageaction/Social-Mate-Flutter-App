import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:social_mate_app/global/widgets/shimmer_box.dart';

class ShimmerNotificaions extends StatelessWidget {
  const ShimmerNotificaions({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<NotificationBloc>().add(LoadNotificationsEvent());
      },
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            constraints: BoxConstraints(minHeight: 100.h),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerBox(height: 48.w, width: 48.w, borderRadius: 100),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShimmerBox(height: 12.w, width: 170.w, borderRadius: 100),
                      4.verticalSpace,
                      ShimmerBox(height: 10.w, width: 100.w, borderRadius: 100),
                      if (index % 2 == 0) ...[
                        12.verticalSpace,
                        ShimmerBox(
                          height: 40.h,
                          width: 100.w,
                          borderRadius: 12.r,
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.grey, size: 22.w),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
