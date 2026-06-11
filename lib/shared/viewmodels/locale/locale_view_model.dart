import 'package:moonlight/core/locale/app_locale.dart';
import 'package:moonlight/core/locale/locale_repository.dart';
import 'package:moonlight/shared/viewmodels/locale/locale_state.dart';
import 'package:state_notifier/state_notifier.dart';

class LocaleViewModel extends StateNotifier<LocaleState> {
  LocaleViewModel(this._repository)
      : super(const LocaleState(locale: AppLocale.english)) {
    _loadSavedLocale();
  }

  final LocaleRepository _repository;

  Future<void> _loadSavedLocale() async {
    final locale = await _repository.getLocale();
    state = state.copyWith(locale: locale);
  }

  Future<void> setLocale(AppLocale locale) async {
    await _repository.saveLocale(locale);
    state = state.copyWith(locale: locale);
  }
}
