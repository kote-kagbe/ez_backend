import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/ui/application/splash.dart';
import 'package:ez_backend/ui/application/error.dart';
import 'package:ez_backend/ui/stand_list/list.dart';
import 'package:ez_backend/intercom/constants/strings.dart'
    show applicationTitle;
import 'package:ez_backend/ui/constants/colors.dart';
import 'package:ez_backend/intercom/app_config/app_config.dart' show AppConfig;

class AppRootScreen extends StatelessWidget {
  const AppRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
        buildWhen: (prevState, newState) => prevState != newState,
        builder: (context, state) => switch (state.value) {
              AppConfigStateValue.error => MaterialApp(
                  title: applicationTitle,
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: systemErrorColor),
                    useMaterial3: true,
                  ),
                  home: const ErrorScreen(),
                ),
              AppConfigStateValue.ready => MaterialApp(
                  title: applicationTitle,
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: context
                            .read<AppConfig>()
                            .colorScheme
                            .sideMenuBackground),
                    useMaterial3: true,
                  ),
                  home: const StandListScreen()),
              _ => MaterialApp(
                  title: applicationTitle,
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: systemColor),
                    useMaterial3: true,
                  ),
                  home: const SplashScreen(),
                )
            });
    // return BlocListener<AppConfigBloc, AppConfigState>(
    //     listenWhen: (prevState, newState) => prevState != newState,
    //     listener: (context, event) {
    //       switch (event.value) {
    //         case AppConfigStateValue.ready:
    //           {
    //             Navigator.of(context).pushReplacement(
    //                 MaterialPageRoute(builder: (_) => const StandListScreen()));
    //           }
    //         case AppConfigStateValue.error:
    //           {
    //             Navigator.of(context).pushReplacement(
    //                 MaterialPageRoute(builder: (_) => const ErrorScreen()));
    //           }
    //         case _:
    //           {
    //             Navigator.of(context).pushReplacement(
    //                 MaterialPageRoute(builder: (_) => const SplashScreen()));
    //           }
    //       }
    //     },
    //     child: MaterialApp(
    //         title: applicationTitle,
    //         theme: ThemeData(
    //           colorScheme: ColorScheme.fromSeed(
    //               seedColor:
    //                   context.read<AppConfig>().colorScheme.sideMenuBackground),
    //           useMaterial3: true,
    //         ),
    //         home: const StandListScreen()));
  }
}
