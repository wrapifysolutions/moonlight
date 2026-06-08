import 'package:flutter/material.dart';

import 'package:moonlight/core/theme/app_theme_mode.dart';

class ThemeState {
  const ThemeState({required this.mode});

  final AppThemeMode mode;

  ThemeMode get materialThemeMode => switch (mode) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        AppThemeMode.system => ThemeMode.system,
      };

  ThemeState copyWith({AppThemeMode? mode}) {
    return ThemeState(mode: mode ?? this.mode);
  }
}
