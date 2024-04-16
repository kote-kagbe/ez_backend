import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/constants/strings.dart'
    show applicationTitle;
import 'package:ez_backend/intercom/app_config/app_config.dart' show AppConfig;
import 'package:ez_backend/ui/application/root.dart';
import 'package:ez_backend/ui/application/error.dart';
import 'package:ez_backend/ui/application/splash.dart';
import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';

class EzBackendApp extends StatelessWidget {
  const EzBackendApp(this.configInit, {super.key});

  final Future configInit;

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<AppConfig>();
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AppConfig>(create: (_) => AppConfig.instance())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AppConfigBloc>(
                create: (context) =>
                    AppConfigBloc(config: context.read<AppConfig>()),
              ),
            ],
            child: FutureBuilder(
                future: configInit,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return MaterialApp(
                        title: applicationTitle,
                        theme: cfg.theme.errorTheme,
                        home: const ErrorScreen(),
                      );
                    } else {
                      return AppRootScreen();
                    }
                  } else {
                    return MaterialApp(
                      title: applicationTitle,
                      theme: cfg.theme.splashTheme,
                      home: const SplashScreen(),
                    );
                  }
                })));
  }
}
