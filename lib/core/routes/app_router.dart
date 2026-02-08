import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/routes/app_paths.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/auth/presentation/pages/auth_page.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/create_post_bloc.dart';
import 'package:social_mate_app/features/create_post/presentation/bloc/media_picker_bloc.dart';
import 'package:social_mate_app/features/create_post/presentation/pages/create_post_page.dart';
import 'package:social_mate_app/features/create_story/presentation/bloc/gallery_bloc.dart';
import 'package:social_mate_app/features/create_story/presentation/cubit/story_bg_controller_cubit.dart';
import 'package:social_mate_app/features/create_story/presentation/pages/create_story_page.dart';
import 'package:social_mate_app/features/create_story/presentation/pages/create_text_story_page.dart';
import 'package:social_mate_app/features/home/domain/entities/story_entity.dart';
import 'package:social_mate_app/features/home/presentation/bloc/post_bloc.dart';
import 'package:social_mate_app/features/home/presentation/bloc/story_bloc.dart';
import 'package:social_mate_app/features/home/presentation/pages/home_page.dart';
import 'package:social_mate_app/features/onboarding/presentation/page/onboarding_page.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_mate_app/features/profile/presentation/pages/profile_page.dart';
import 'package:social_mate_app/features/splash/presentation/page/splash_page.dart';
import 'package:social_mate_app/features/story_viewer/presentation/bloc/story_viewer_bloc.dart';
import 'package:social_mate_app/global/widgets/bottom_nav_bar.dart';
import 'package:social_mate_app/global/bloc/app_flow_bloc.dart';
import 'package:social_mate_app/features/story_viewer/presentation/pages/story_viewer_page.dart';

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
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => BlocProvider.value(
            value: getIt<ProfileBloc>(),
            child: BottomNavBar(navigationShell: navigationShell),
          ),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppPaths.home,
                  builder: (context, state) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => getIt<StoryBloc>()),
                      BlocProvider(
                        create: (context) => getIt<StoryViewerBloc>(),
                      ),
                      BlocProvider(create: (context) => getIt<PostBloc>()),
                    ],
                    child: const HomePage(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/search',
                  builder: (context, state) =>
                      const Scaffold(body: Center(child: Text('Search'))),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/bag',
                  builder: (context, state) =>
                      const Scaffold(body: Center(child: Text('Bag'))),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/group',
                  builder: (context, state) =>
                      const Scaffold(body: Center(child: Text('Group'))),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppPaths.profile,
                  builder: (context, state) => BlocProvider(
                    create: (context) => getIt<AuthBloc>(),
                    child: const ProfilePage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: AppPaths.onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: AppPaths.createStory,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<GalleryBloc>(),
            child: const CreateStoryPage(),
          ),
        ),
        GoRoute(
          path: AppPaths.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppPaths.createTextStory,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<StoryBgControllerCubit>(),
            child: const CreateTextStoryPage(),
          ),
        ),
        GoRoute(
          path: AppPaths.auth,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const AuthPage(),
          ),
        ),
        GoRoute(
          path: AppPaths.createPost,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<MediaPickerBloc>()),
              BlocProvider(create: (context) => getIt<CreatePostBloc>()),
              BlocProvider.value(
                value: getIt<ProfileBloc>(),
              ),
            ],
            child: const CreatePostPage(),
          ),
        ),
        GoRoute(
          path: AppPaths.storyViewer,
          builder: (context, state) {
            final stories = state.extra as List<StoryEntity>;
            return StoryViewerPage(stories: stories);
          },
        ),
      ],
    );
  }
}
