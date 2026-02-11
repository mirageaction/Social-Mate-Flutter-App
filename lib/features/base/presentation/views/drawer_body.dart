import 'package:flutter/material.dart' hide DrawerHeader;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/features/base/presentation/views/drawer_item.dart';
import 'package:social_mate_app/features/profile/domain/entities/profile_entity.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_mate_app/features/base/presentation/views/drawer_header.dart';

class MenuItem {
  final String title;
  final String icon;
  final VoidCallback onTap;

  MenuItem({required this.title, required this.icon, required this.onTap});
}

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
    final icons = Assets.icons;
    final strings = AppStrings.of(context);

    final List<MenuItem> menuItems = [
      MenuItem(title: strings.editProfile, icon: icons.edit.path, onTap: () {}),
      MenuItem(title: strings.network, icon: icons.network.path, onTap: () {}),
      MenuItem(
        title: strings.photosVideos,
        icon: icons.imagesVideos.path,
        onTap: () {},
      ),
      MenuItem(title: strings.groups, icon: icons.group.path, onTap: () {}),
      MenuItem(title: strings.searchProfile, icon: icons.search.path, onTap: () {}),
      MenuItem(title: strings.language, icon: icons.translate.path, onTap: () {}),
      MenuItem(title: strings.settings, icon: icons.settings.path, onTap: () {}),
      MenuItem(title: strings.yourPrivacy, icon: icons.privacy.path, onTap: () {}),
      MenuItem(title: strings.aboutUs, icon: icons.info.path, onTap: () {}),
      MenuItem(title: strings.logout, icon: icons.logout.path, onTap: () {}),
    ];

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocSelector<ProfileBloc, ProfileState, ProfileEntity?>(
            selector: (state) {
              return state is ProfileLoaded ? state.profile : null;
            },
            builder: (context, profile) {
              return DrawerHeader(textTheme: textTheme, profile: profile);
            },
          ),
          16.verticalSpace,
          Divider(color: colorScheme.outline),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return DrawerItem(
                  title: item.title,
                  icon: item.icon,
                  onTap: item.onTap,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
