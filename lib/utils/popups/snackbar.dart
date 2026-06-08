import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/colors.dart';
import 'package:moonlight/utils/constants/text_styles.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void showSuccess(BuildContext context, String message) {
    _show(context, message: message, backgroundColor: AppColors.success);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message: message, backgroundColor: AppColors.error);
  }

  static void showWarning(BuildContext context, String message) {
    _show(context, message: message, backgroundColor: AppColors.warning);
  }

  static void showInfo(BuildContext context, String message) {
    _show(context, message: message, backgroundColor: AppColors.lightOnBackground);
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: TextStyles.fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
