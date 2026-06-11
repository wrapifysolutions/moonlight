import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class TextStyles {
  TextStyles._();

  static const String fontFamily = 'Poppins';

  static TextTheme get lightTextTheme => _baseTextTheme();
  static TextTheme get darkTextTheme => _baseTextTheme();

  /// Scaled text theme — call only after [AppSizes.initFromMediaQuery].
  static TextTheme get scaledTextTheme => _scaledTextTheme();

  static TextTheme _baseTextTheme() => const TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 8,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 7,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 6,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 8,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 7,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        labelSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 5.5,
          fontWeight: FontWeight.w500,
          color: AppColors.textMuted,
        ),
      );

  static TextTheme _scaledTextTheme() => TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(30),
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(22),
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(18),
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(16),
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(14),
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(12),
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(11),
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(10),
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(8),
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(8),
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(7),
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(6),
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(8),
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(7),
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        labelSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: AppSizes.responsiveFont(5.5),
          fontWeight: FontWeight.w500,
          color: AppColors.textMuted,
        ),
      );
}
