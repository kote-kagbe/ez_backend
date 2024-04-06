part 'app_config_main.dart';

sealed class AppConfigItem {
  Future<void> update();
}
