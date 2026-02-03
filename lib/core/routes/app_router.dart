import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/auth/presentation/pages/auth_page.dart';
import 'package:social_mate_app/features/home/presentation/bloc/story_bloc.dart';
import 'package:social_mate_app/features/home/presentation/pages/home_page.dart';
import 'package:social_mate_app/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:social_mate_app/features/splash/presentation/page/splash_page.dart';
import 'package:social_mate_app/features/widgets/bottom_nav_bar.dart';
import 'package:social_mate_app/global/bloc/app_flow_bloc.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream stream) {
    notifyListeners();
    stream.listen((_) => notifyListeners());
  }
}

class AppRouter {
  static GoRouter router({required AppFlowBloc appFlowBloc}) {
    return GoRouter(
      refreshListenable: GoRouterRefreshStream(appFlowBloc.stream),
      initialLocation: AppPaths.splash,
      redirect: (context, state) {
        final status = appFlowBloc.state.status;
        final location = state.matchedLocation;

        // 1. Splash logic
        if (status == AppFlowStatus.unknown) {
          return AppPaths.splash;
        }

        // 2. Authenticated logic
        if (status == AppFlowStatus.authenticated) {
          // If logged in, don't allow access to splash, onboarding, or auth
          if (location == AppPaths.splash ||
              location == AppPaths.onboarding ||
              location == AppPaths.auth) {
            return AppPaths.home;
          }
          return null; // No redirect needed
        }

        // 3. Unauthenticated logic
        if (status == AppFlowStatus.unauthenticated) {
          // If not logged in, only allow access to onboarding and auth
          if (location != AppPaths.onboarding && location != AppPaths.auth) {
            return AppPaths.onboarding;
          }
          return null;
        }

        return null;
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) => BottomNavBar(child: child),
          routes: [
            GoRoute(
              path: AppPaths.home,
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<StoryBloc>(),
                child: const HomePage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: AppPaths.onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: AppPaths.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppPaths.auth,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const AuthPage(),
          ),
        ),
      ],
    );
  }
}
