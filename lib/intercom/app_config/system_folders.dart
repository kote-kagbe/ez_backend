import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SystemFolders {
  const SystemFolders([this.dataFolder, this.tempFolder, this.cacheFolder]);

  final String? dataFolder, tempFolder, cacheFolder;

  // костыль для асинхронного заполнения папок
  Future<SystemFolders> setup() async {
    final List<Directory> folders = await Future.wait([
      getApplicationSupportDirectory(),
      getTemporaryDirectory(),
      getApplicationCacheDirectory()
    ]);
    return SystemFolders(folders[0].path, folders[1].path, folders[2].path);
  }
}
