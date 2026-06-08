import 'package:moonlight/core/local_storage/local_storage_service.dart';
import 'package:moonlight/core/theme/app_theme_mode.dart';

class ThemeRepository {
  ThemeRepository(this._localStorage);

  final LocalStorageService _localStorage;

  Future<AppThemeMode> getThemeMode() async {
    final value = _localStorage.getString(LocalStorageService.themeModeKey);
    if (value == null) return AppThemeMode.system;
    return AppThemeMode.fromString(value);
  }

  Future<void> saveThemeMode(AppThemeMode mode) async {
    await _localStorage.setString(
      LocalStorageService.themeModeKey,
      mode.name,
    );
  }
}
