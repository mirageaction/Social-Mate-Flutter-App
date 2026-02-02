import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/auth/presentation/pages/auth_page.dart';
import 'package:social_mate_app/features/onboarding/presentation/page/onboarding_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppPaths.auth,
    routes: [
      GoRoute(
        path: AppPaths.onboarding,
        builder: (context, state) => const OnboardingPage(),
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
