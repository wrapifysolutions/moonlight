import 'package:moonlight/core/theme/app_theme_mode.dart';
import 'package:moonlight/core/theme/theme_repository.dart';
import 'package:moonlight/shared/viewmodels/theme/theme_state.dart';
import 'package:state_notifier/state_notifier.dart';

class ThemeViewModel extends StateNotifier<ThemeState> {
  ThemeViewModel(this._repository)
      : super(const ThemeState(mode: AppThemeMode.system)) {
    _loadSavedTheme();
  }

  final ThemeRepository _repository;

  Future<void> _loadSavedTheme() async {
    final mode = await _repository.getThemeMode();
    state = state.copyWith(mode: mode);
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    await _repository.saveThemeMode(mode);
    state = state.copyWith(mode: mode);
  }

  Future<void> toggleLightDark() async {
    final nextMode = switch (state.mode) {
      AppThemeMode.light => AppThemeMode.dark,
      AppThemeMode.dark => AppThemeMode.light,
      AppThemeMode.system => AppThemeMode.dark,
    };
    await setThemeMode(nextMode);
  }
}
