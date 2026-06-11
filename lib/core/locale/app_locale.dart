import 'package:flutter/material.dart';

enum AppLocale {
  arabic('ar'),
  english('en'),
  indonesian('id'),
  russian('ru');

  const AppLocale(this.languageCode);

  final String languageCode;

  Locale get materialLocale => Locale(languageCode);

  static AppLocale fromLanguageCode(String? code) {
    return AppLocale.values.firstWhere(
      (locale) => locale.languageCode == code,
      orElse: () => AppLocale.english,
    );
  }

  static AppLocale fromOptionCode(String code) {
    return switch (code) {
      'AR' => AppLocale.arabic,
      'EN' => AppLocale.english,
      'IN' => AppLocale.indonesian,
      'RA' => AppLocale.russian,
      _ => AppLocale.english,
    };
  }

  String get optionCode => switch (this) {
        AppLocale.arabic => 'AR',
        AppLocale.english => 'EN',
        AppLocale.indonesian => 'IN',
        AppLocale.russian => 'RA',
      };
}
