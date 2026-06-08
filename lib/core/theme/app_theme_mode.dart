enum AppThemeMode {
  light,
  dark,
  system;

  static AppThemeMode fromString(String value) {
    return AppThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => AppThemeMode.system,
    );
  }
}
