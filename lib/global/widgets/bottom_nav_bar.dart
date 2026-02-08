import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_mate_app/global/widgets/shimmer_avater.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: _BottomNavBarItem(
              colorScheme: colorScheme,
              icon: Assets.icons.home.path,
              isSelected: navigationShell.currentIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _BottomNavBarItem(
              colorScheme: colorScheme,
              icon: Assets.icons.userPlus.path,
              isSelected: navigationShell.currentIndex == 1,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: _BottomNavBarItem(
              colorScheme: colorScheme,
              icon: Assets.icons.bag.path,
              isSelected: navigationShell.currentIndex == 2,
            ),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: _BottomNavBarItem(
              colorScheme: colorScheme,
              icon: Assets.icons.group.path,
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
                return ShimmerAvatar(
                  size: 30.w,
                  imageUrl: state?.avatarUrl ?? '',
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
      ),
      body: navigationShell,
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.colorScheme,
    required this.icon,
    this.isSelected = false,
  });

  final ColorScheme colorScheme;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colorScheme.primary.withValues(alpha: 0.1),
            )
          : null,
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
          BlendMode.srcIn,
        ),
        width: 24.w,
        height: 24.w,
      ),
    );
  }
}
