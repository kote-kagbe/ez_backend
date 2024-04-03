class AppConfig {
  static final AppConfig _instance = AppConfig._single();

  AppConfig._single();

  factory AppConfig.instance() => _instance;
}
