import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/routes/app_router.dart';
import 'package:moonlight/core/theme/app_theme.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_provider.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeViewModelProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Moonlight',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeState.materialThemeMode,
      routerConfig: router,
      builder: (context, child) {
        if (!AppSizes.initialized) {
          AppSizes.initFromMediaQuery(MediaQuery.of(context));
        }
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
