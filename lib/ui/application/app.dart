import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/constants/strings.dart'
    show applicationTitle;
import 'package:ez_backend/intercom/app_config/app_config.dart' show AppConfig;
import 'package:ez_backend/ui/application/root.dart';
import 'package:ez_backend/ui/application/error.dart';
import 'package:ez_backend/ui/application/splash.dart';
import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/ui/constants/colors.dart';

class EzBackendApp extends StatefulWidget {
  const EzBackendApp(this.configInit, {super.key});

  final Future<bool> configInit;

  @override
  State<StatefulWidget> createState() => EzBackendAppState();
}

class EzBackendAppState extends State<EzBackendApp> {
  @override
  Widget build(BuildContext context) {
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
                future: widget.configInit,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return MaterialApp(
                        title: applicationTitle,
                        theme: ThemeData(
                          colorScheme:
                              ColorScheme.fromSeed(seedColor: systemErrorColor),
                          useMaterial3: true,
                        ),
                        home: const ErrorScreen(),
                      );
                    } else {
                      return AppRootScreen();
                    }
                  } else {
                    return MaterialApp(
                      title: applicationTitle,
                      theme: ThemeData(
                        colorScheme:
                            ColorScheme.fromSeed(seedColor: systemColor),
                        useMaterial3: true,
                      ),
                      home: const SplashScreen(),
                    );
                  }
                })));
  }
}
