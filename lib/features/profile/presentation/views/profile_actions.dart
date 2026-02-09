import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: double.infinity,
                height: 60.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.outline),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  'Edit Profile'.toUpperCase(),
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          16.horizontalSpace,
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              width: 60.w,
              height: 60.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.settings_outlined,
                color: colorScheme.onSurfaceVariant,
                size: 30.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
