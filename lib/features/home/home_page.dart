import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moonlight/core/theme/app_theme_mode.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_provider.dart';
import 'package:moonlight/utils/l10n/l10n_extension.dart';
import 'package:moonlight/utils/device/responsive_layout.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final themeMode = ref.watch(themeViewModelProvider).mode;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(themeViewModelProvider.notifier).toggleLightDark(),
            icon: Icon(
              themeMode == AppThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: l10n.toggleTheme,
          ),
        ],
      ),
      body: ResponsiveLayout(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.width(6)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.homeCounterPrompt,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSizes.height(2)),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: l10n.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
