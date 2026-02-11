import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/base/presentation/views/bottom_nav_bar.dart';
import 'package:social_mate_app/features/base/presentation/views/drawer_body.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    final profileBloc = context.read<ProfileBloc>();
    if (profileBloc.state is! ProfileLoaded) {
      profileBloc.add(GetProfileEvent());
    }
  }

  @override
  void dispose() {
    _advancedDrawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: colorScheme.surface),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      drawer: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: DrawerBody(textTheme: textTheme, colorScheme: colorScheme),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(navigationShell: widget.navigationShell),
        body: widget.navigationShell,
      ),
    );
  }
}