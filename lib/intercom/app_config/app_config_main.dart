part of 'app_config.dart';

class AppConfig extends AppConfigItem {
  static final AppConfig _instance = AppConfig._single();

  AppConfig._single();

  factory AppConfig.instance() => _instance;

  bool? _init;

  @override
  Future<bool> update() {
    if (_init == null) {
      _init = false;
      return Future.delayed(const Duration(seconds: 4), () {
        _init = true;
        return true;
      }); //Future.sync(() => null);
    } else {
      return Future.value(_init);
    }
  }

  Future<void> updateItem(AppConfigItem item) {
    return Future.value();
  }
}
