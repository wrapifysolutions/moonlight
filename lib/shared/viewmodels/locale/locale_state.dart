import 'package:flutter/material.dart';

import 'package:moonlight/core/locale/app_locale.dart';

class LocaleState {
  const LocaleState({required this.locale});

  final AppLocale locale;

  Locale get materialLocale => locale.materialLocale;

  LocaleState copyWith({AppLocale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }
}
