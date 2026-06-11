import 'package:moonlight/core/locale/app_locale.dart';
import 'package:moonlight/core/local_storage/local_storage_service.dart';

class LocaleRepository {
  LocaleRepository(this._localStorage);

  final LocalStorageService _localStorage;

  Future<AppLocale> getLocale() async {
    final value = _localStorage.getString(LocalStorageService.languageCodeKey);
    if (value == null) return AppLocale.english;
    return AppLocale.fromLanguageCode(value);
  }

  Future<void> saveLocale(AppLocale locale) async {
    await _localStorage.setString(
      LocalStorageService.languageCodeKey,
      locale.languageCode,
    );
  }
}
