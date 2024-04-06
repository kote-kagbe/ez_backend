import 'dart:async';
import 'package:flutter/material.dart';

import 'package:ez_backend/ui/application/app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      //
    };
    runApp(const EzBackendApp());
  }, (error, stack) {
    //
  });
}
