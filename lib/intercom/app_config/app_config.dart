import 'package:json_annotation/json_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:ez_backend/intercom/app_config/color_scheme.dart';
import 'package:ez_backend/intercom/app_config/system_folders.dart';

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

  AppConfig([
    this.colorScheme = const AppColorScheme(),
    this.systemFolders = const SystemFolders(),
    this.appVersion = '0.0.0.0',
    this.customColorScheme = false,
  ]);

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
    if (!resetColorScheme && json != null && json.containsKey('colorScheme')) {
      colorScheme = AppColorScheme.fromJson(json['colorScheme']);
      customColorScheme = configPath != null;
    } else {
      customColorScheme = false;
      colorScheme = const AppColorScheme();
    }
  }

  Future<Map<String, dynamic>?> _loadConfig(String? path) async {
    return Future.value();
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
