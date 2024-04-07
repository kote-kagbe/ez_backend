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

//////////////////////////////////////////////////////////////////////////////
  // элементы конфига
  AppColorScheme colorScheme;
  SystemFolders systemFolders;
//////////////////////////////////////////////////////////////////////////////
  // список элементов, которые можно перечитать из конфига
  // имена совпадают с именем соответствующей переменной
  final _canUpdate = <UpdateData>[
    (
      name: 'colorScheme',
      builder: AppColorScheme.fromJson,
      variable: #colorScheme
    ),
  ];
//////////////////////////////////////////////////////////////////////////////

  // метод для перечитывания конфига с диска
  Future<bool> update() async {
    // читаем из файла
    final Map<String, dynamic> json = {};
    // обновляем указанные поля
    for (final element in _canUpdate) {
      final data = json[element.name];
      if (data != null) {
        var variable = element.variable;
        variable = element.builder(data);
      }
    }
    // добиваем нестандартные случаи
    systemFolders = await systemFolders.setup();
    return true;
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
