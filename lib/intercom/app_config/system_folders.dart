import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';

@JsonSerializable()
class SystemFolders {
  const SystemFolders([this.dataFolder, this.tempFolder, this.cacheFolder]);

  final String? dataFolder, tempFolder, cacheFolder;

  factory SystemFolders.fromJson(Map<String, dynamic> json) =>
      const SystemFolders();
  // папки в конфиге не храним
  Map<String, dynamic> toJson() => {};

  // костыль для асинхронного заполнения папок
  Future<SystemFolders> setup() async {
    final dataFolder = (await getApplicationSupportDirectory()).path;
    final tempFolder = (await getTemporaryDirectory()).path;
    final cacheFolder = (await getApplicationCacheDirectory()).path;
    return SystemFolders(dataFolder, tempFolder, cacheFolder);
  }
}
