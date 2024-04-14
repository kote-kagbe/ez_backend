import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/ui/application/splash.dart';
import 'package:ez_backend/ui/application/error.dart';
import 'package:ez_backend/ui/stand_list/list.dart';
import 'package:ez_backend/intercom/constants/strings.dart'
    show applicationTitle;
import 'package:ez_backend/ui/constants/colors.dart';
import 'package:ez_backend/intercom/app_config/app_config.dart' show AppConfig;
import 'package:ez_backend/ui/application/theme.dart';

class AppRootScreen extends StatelessWidget {
  const AppRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
        buildWhen: (prevState, newState) => prevState != newState,
        builder: (context, state) => switch (state.value) {
          AppConfigStateValue.error => MaterialApp(
              title: applicationTitle,
              theme: errorTheme(context.read<AppConfig>().colorScheme),
              home: const ErrorScreen(),
            ),
          AppConfigStateValue.ready => MaterialApp(
            scrollBehavior: const MaterialScrollBehavior()
                .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
              title: applicationTitle,
              theme: appTheme(context.read<AppConfig>().colorScheme) ,
              home: const StandListScreen(),
            ),
          _ => MaterialApp(
              title: applicationTitle,
              theme: splashTheme(context.read<AppConfig>().colorScheme),
              home: const SplashScreen(),
            )
        }
    );
  }
}
