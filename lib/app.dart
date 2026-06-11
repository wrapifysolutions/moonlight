import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/core/theme/app_theme.dart';
import 'package:moonlight/l10n/app_localizations.dart';
import 'package:moonlight/shared/viewmodels/locale/locale_provider.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_provider.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  ThemeData _resolveBaseTheme(
    ThemeMode mode,
    Brightness platformBrightness,
  ) {
    return switch (mode) {
      ThemeMode.light => AppTheme.light,
      ThemeMode.dark => AppTheme.dark,
      ThemeMode.system => platformBrightness == Brightness.dark
          ? AppTheme.dark
          : AppTheme.light,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeViewModelProvider);
    final localeState = ref.watch(localeViewModelProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: lookupAppLocalizations(localeState.materialLocale).appName,
      locale: localeState.materialLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeState.materialThemeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        AppSizes.initFromMediaQuery(mediaQuery);

        final baseTheme = _resolveBaseTheme(
          themeState.materialThemeMode,
          mediaQuery.platformBrightness,
        );

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: mediaQuery.textScaler.clamp(
              minScaleFactor: 0.85,
              maxScaleFactor: 1.25,
            ),
          ),
          child: Theme(
            data: AppTheme.withResponsiveScaling(baseTheme),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
