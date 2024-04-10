import 'package:path_provider/path_provider.dart';

class SystemFolders {
  const SystemFolders([this.dataFolder, this.tempFolder, this.cacheFolder]);

  final String? dataFolder, tempFolder, cacheFolder;

  // костыль для асинхронного заполнения папок
  Future<SystemFolders> setup() async {
    final dataFolder = (await getApplicationSupportDirectory()).path;
    final tempFolder = (await getTemporaryDirectory()).path;
    final cacheFolder = (await getApplicationCacheDirectory()).path;
    return SystemFolders(dataFolder, tempFolder, cacheFolder);
  }
}
