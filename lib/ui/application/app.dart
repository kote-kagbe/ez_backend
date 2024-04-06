import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/constants/strings.dart'
    show applicationTitle;
import 'package:ez_backend/intercom/app_config/app_config.dart' show AppConfig;
import 'package:ez_backend/ui/application/root.dart';
import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';

class EzBackendApp extends StatelessWidget {
  const EzBackendApp({super.key});

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
            child: MaterialApp(
              title: applicationTitle,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                useMaterial3: true,
              ),
              home: const AppRootScreen(),
            )));
  }
}
