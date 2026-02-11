import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/base/presentation/views/bottom_nav_bar_item.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final icons = Assets.icons;
    return BottomNavigationBar(
      useLegacyColorScheme: false,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      items: [
        BottomNavigationBarItem(
          icon: BottomNavBarItem(
            colorScheme: colorScheme,
            icon: icons.home.path,
            isSelected: navigationShell.currentIndex == 0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarItem(
            colorScheme: colorScheme,
            icon: icons.userPlus.path,
            isSelected: navigationShell.currentIndex == 1,
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarItem(
            colorScheme: colorScheme,
            icon: icons.bag.path,
            isSelected: navigationShell.currentIndex == 2,
          ),
          label: 'Bag',
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarItem(
            colorScheme: colorScheme,
            icon: icons.group.path,
            isSelected: navigationShell.currentIndex == 3,
          ),
          label: 'Group',
        ),
        BottomNavigationBarItem(
          icon: BlocSelector<ProfileBloc, ProfileState, ProfileEntity?>(
            selector: (state) {
              return state is ProfileLoaded ? state.profile : null;
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: navigationShell.currentIndex == 4
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: colorScheme.primary.withValues(alpha: 0.1),
                      )
                    : null,
                child: ShimmerAvater(
                  size: 30.w,
                  imageUrl: state?.avatarUrl ?? '',
                  padding: 8,
                ),
              );
            },
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
    );
  }
}
