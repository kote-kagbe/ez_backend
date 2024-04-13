import 'dart:async';
import 'package:flutter/material.dart';

import 'package:ez_backend/ui/application/app.dart';
import 'package:ez_backend/intercom/app_config/app_config.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cfgInit = AppConfig.instance().update();
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      //
    };
    runApp(EzBackendApp(cfgInit));
  }, (error, stack) {
    //
  });
}
