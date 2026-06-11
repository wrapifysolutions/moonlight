import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class AppTheme {
  AppTheme._();

  // Light is dark-first — kept minimal until a light design exists
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: TextStyles.fontFamily,
      textTheme: TextStyles.lightTextTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.darkOnPrimary,
        secondary: AppColors.primaryLight,
        surface: AppColors.darkSurface,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: TextStyles.fontFamily,
      textTheme: TextStyles.darkTextTheme,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,           // #7B61FF
        onPrimary: AppColors.darkOnPrimary,   // white
        secondary: AppColors.primaryLight,    // #C084FC
        onSecondary: AppColors.darkOnPrimary,
        surface: AppColors.darkSurface,       // #12002A
        onSurface: AppColors.textPrimary,     // white
        error: AppColors.error,
        onError: AppColors.darkOnPrimary,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground, // #0A0015

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, // screens use globe bg
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.darkOnPrimary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.textMuted,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
      ),

      cardTheme: const CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
      ),
    );
  }

  /// Applies scaled typography and input radii after [AppSizes] is initialized.
  static ThemeData withResponsiveScaling(ThemeData base) {
    if (!AppSizes.initialized) return base;

    final borderRadius = BorderRadius.circular(AppSizes.radius(8));

    return base.copyWith(
      textTheme: TextStyles.scaledTextTheme,
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        hintStyle: base.inputDecorationTheme.hintStyle?.copyWith(
          fontSize: AppSizes.font(12),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.textMuted.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}