import 'package:json_annotation/json_annotation.dart';

import 'package:ez_backend/intercom/app_config/color_scheme.dart';
import 'package:ez_backend/intercom/app_config/system_folders.dart';

part 'app_config.g.dart';

typedef JSON = Map<String, dynamic>;
typedef UpdateData<T> = ({
  String name,
  T Function(JSON) builder,
  Symbol variable
});

@JsonSerializable(explicitToJson: true)
class AppConfig {
  static final AppConfig _instance = AppConfig();

  factory AppConfig.instance() => _instance;

  AppConfig([
    this.colorScheme = const AppColorScheme(),
    this.systemFolders = const SystemFolders(),
  ]);

  bool? _init;

//////////////////////////////////////////////////////////////////////////////
  // элементы конфига
  AppColorScheme colorScheme;
  SystemFolders systemFolders;
//////////////////////////////////////////////////////////////////////////////

  // метод для перечитывания конфига с диска
  Future<bool> update() async {
    if (_init != null) {
      return Future.value(_init);
    }
    _init = false;
    // папки в первую очередь
    systemFolders = await systemFolders.setup();
    // читаем из файла
    final Map<String, dynamic> json = {};
    // обновляем указанные поля
    if (json.containsKey('colorScheme')) {
      colorScheme = AppColorScheme.fromJson(json['colorScheme']);
    }
    _init = true;
    return _init!;
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
