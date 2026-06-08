import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moonlight/core/local_storage/local_storage_service.dart';
import 'package:moonlight/core/theme/theme_repository.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_state.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_view_model.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main.dart');
});

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(ref.watch(sharedPreferencesProvider));
});

final themeRepositoryProvider = Provider<ThemeRepository>((ref) {
  return ThemeRepository(ref.watch(localStorageProvider));
});

final themeViewModelProvider =
    StateNotifierProvider<ThemeViewModel, ThemeState>((ref) {
  return ThemeViewModel(ref.watch(themeRepositoryProvider));
});
