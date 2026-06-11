import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'package:moonlight/core/locale/locale_repository.dart';
import 'package:moonlight/shared/viewmodels/locale/locale_state.dart';
import 'package:moonlight/shared/viewmodels/locale/locale_view_model.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_provider.dart';

final localeRepositoryProvider = Provider<LocaleRepository>((ref) {
  return LocaleRepository(ref.watch(localStorageProvider));
});

final localeViewModelProvider =
    StateNotifierProvider<LocaleViewModel, LocaleState>((ref) {
  return LocaleViewModel(ref.watch(localeRepositoryProvider));
});
