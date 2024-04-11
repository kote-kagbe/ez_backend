import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/app_config.dart' show AppConfig;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: context.read<AppConfig>().colorScheme.sideMenuBackground,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  'инициализация...',
                  style: TextStyle(
                      color: context
                          .read<AppConfig>()
                          .colorScheme
                          .sideMenuItemText),
                ))
          ],
        )
      ]),
    ));
  }
}
