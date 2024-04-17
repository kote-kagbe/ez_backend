import 'package:json_annotation/json_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:ez_backend/intercom/app_config/color_scheme.dart';
import 'package:ez_backend/intercom/app_config/system_folders.dart';
import 'package:ez_backend/intercom/app_config/theme.dart';

part 'app_config.g.dart';

typedef JSON = Map<String, dynamic>;
typedef UpdateData<T> = ({
  String name,
  T Function(JSON) builder,
  Symbol variable
});

@JsonSerializable(explicitToJson: true, ignoreUnannotated: true)
class AppConfig {
  static final AppConfig _instance = AppConfig();

  factory AppConfig.instance() => _instance;

  AppConfig({
    // конфиг
    this.colorScheme = const AppColorScheme(),
    this.customColorScheme = false,
    // вычисляемые
    this.systemFolders = const SystemFolders(),
    this.appVersion = '0.0.0.0',
    this.theme = const AppTheme(),
  });

//////////////////////////////////////////////////////////////////////////////
  // элементы файла конфига
  @JsonKey()
  AppColorScheme colorScheme;
  @JsonKey()
  bool customColorScheme;
//////////////////////////////////////////////////////////////////////////////
  // вычисляемые элементы
  SystemFolders systemFolders;
  String appVersion;
  AppTheme theme;
//////////////////////////////////////////////////////////////////////////////

  // метод для перечитывания конфига с диска
  Future<void> update(
      {String? configPath, bool resetColorScheme = false}) async {
    await Future.delayed(const Duration(seconds: 4));
    // папки в первую очередь
    systemFolders = await systemFolders.setup();
    // версия
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = '${packageInfo.version}.${packageInfo.buildNumber}';
    // читаем из файла
    Map<String, dynamic>? json = await _loadConfig(configPath);
    // обновляем цветовую схему
    if (resetColorScheme) {
      customColorScheme = false;
      colorScheme = const AppColorScheme();
    } else if (json != null && json.containsKey('colorScheme')) {
      colorScheme = AppColorScheme.fromJson(json['colorScheme']);
      customColorScheme = configPath != null;
    }
    // заполняем темы оформления
    theme = theme.setup(colorScheme);
  }

  Future<Map<String, dynamic>?> _loadConfig(String? path) async {
    return Future.value();
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
