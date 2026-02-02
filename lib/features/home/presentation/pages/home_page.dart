import 'package:flutter/material.dart';
import 'package:flutter_decorated_container/flutter_decorated_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/home/presentation/views/home_app_bar.dart';
import 'package:social_mate_app/features/widgets/svg_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: HomeAppBar(colorScheme: colorScheme),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            24.verticalSpace,
            DecoratedContainer(
              strokeColor: colorScheme.secondary,
              strokeWidth: 1,
              dashSpace: 1,
              dashWidth: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorScheme.primary.withValues(alpha: 0.07),
                      colorScheme.primary.withValues(alpha: 0.03),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_2,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        Text(
                          'What\'s on your mind?',
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 4.w,
                        children: [
                          SvgIcon(
                            path: Assets.icons.image.path,
                            size: 24.w,
                            color: colorScheme.secondary,
                          ),
                          Text('Image | ', style: textTheme.bodyLarge),
                          SvgIcon(
                            path: Assets.icons.videos.path,
                            size: 24.w,
                            color: colorScheme.secondary,
                          ),
                          Text('Videos | ', style: textTheme.bodyLarge),
                          SvgIcon(
                            path: Assets.icons.attach.path,
                            size: 24.w,
                            color: colorScheme.secondary,
                          ),
                          Text('Attach', style: textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
