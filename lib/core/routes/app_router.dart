import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/onboarding/presentation/page/onboarding_page.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppPaths.onboarding,
    routes: [
      GoRoute(
        path: AppPaths.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
    ], 
  );
}