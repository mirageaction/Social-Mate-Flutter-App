import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocSelector<ProfileBloc, ProfileState, ProfileEntity?>(
            selector: (state) {
              return state is ProfileLoaded ? state.profile : null;
            },
            builder: (context, profile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  24.verticalSpace,
                  ShimmerAvater(
                    size: 128.w,
                    onTap: () {
                      context.push(AppPaths.profile);
                      //_advancedDrawerController.toggleDrawer();
                    },
                    imageUrl: profile?.avatarUrl ?? '',
                  ),
                  16.verticalSpace,
                  Text(
                    profile?.name ?? '',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.verticalSpace,
                  Text(profile?.username ?? '', style: textTheme.bodyMedium),
                ],
              );
            },
          ),
          16.verticalSpace,
          Divider(color: colorScheme.outline),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.favorite),
            title: Text('Favourites'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          Spacer(),
          DefaultTextStyle(
            style: TextStyle(fontSize: 12, color: Colors.white54),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Terms of Service | Privacy Policy'),
            ),
          ),
        ],
      ),
    );
  }
}
