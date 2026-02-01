import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_toolkit/ui/system/system_ui_wrapper.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:social_mate_app/core/routes/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_mate_app/core/theme/light_text_theme.dart';
import 'package:social_mate_app/core/theme/light_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  Bloc.observer = TalkerBlocObserver();
  
  // load environment variables
  await dotenv.load(fileName: ".env");

  // initialize supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const SocialMateApp());
}

class SocialMateApp extends StatelessWidget {
  const SocialMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        title: 'Social Mate',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: createLightTheme(lightTextTheme()),
        themeMode: ThemeMode.light,
        localizationsDelegates: [
          AppStrings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppStrings.delegate.supportedLocales,
        builder: (context, child) {
          final colorScheme = Theme.of(context).colorScheme;
          return SystemUIWrapper(
            statusBarColor: colorScheme.surface,
            statusBarIconBrightness: Brightness.dark,
            navigationBarColor: colorScheme.surface,
            navigationBarIconBrightness: Brightness.dark,
            child: child!,
          );
        },
      ),
    );
  }
}
