import 'package:flutter/material.dart';
import 'package:social_mate_app/core/theme/app_colors.dart';

ThemeData createLightTheme(TextTheme textTheme) {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: LightColorScheme.primary,
    secondary: LightColorScheme.secondary,
    tertiary: LightColorScheme.tertiary,
    surface: LightColorScheme.surface,
    surfaceContainer: LightColorScheme.surfaceContainer,
    background: LightColorScheme.background,
    error: LightColorScheme.error,
    errorContainer: LightColorScheme.errorContainer,
    outline: LightColorScheme.outline,
    outlineVariant: LightColorScheme.outlineVariant,
    scrim: LightColorScheme.scrim,
    onPrimary: LightColorScheme.onPrimary,
    onSecondary: LightColorScheme.onSecondary,
    onTertiary: LightColorScheme.onTertiary,
    onSurface: LightColorScheme.onSurface,
    onSurfaceVariant: LightColorScheme.onSurfaceVariant,
    onBackground: LightColorScheme.onBackground,
    onError: LightColorScheme.onError,
    shadow: LightColorScheme.shadow,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: LightColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: LightColorScheme.surface,
      foregroundColor: LightColorScheme.onSurface,
      surfaceTintColor: LightColorScheme.surface,
      elevation: 0,
      
      titleTextStyle: textTheme.headlineSmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColorScheme.primary,
        foregroundColor: LightColorScheme.onPrimary,
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: LightColorScheme.primary,
        side: const BorderSide(color: LightColorScheme.primary),
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightColorScheme.primary,
        textStyle: textTheme.labelLarge,
      ),
    ),
    cardTheme: CardThemeData(
      color: LightColorScheme.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: LightColorScheme.surfaceContainer,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: LightColorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: LightColorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: LightColorScheme.error, width: 2),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: LightColorScheme.onSurfaceVariant,
      ),
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: LightColorScheme.primary,
      ),
    ),
    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColorScheme.surface,
      selectedItemColor: LightColorScheme.primary,
      unselectedItemColor: LightColorScheme.onSurfaceVariant,
      elevation: 8,
    ),
  );
}
