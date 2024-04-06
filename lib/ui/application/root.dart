import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/ui/application/splash.dart';
import 'package:ez_backend/ui/application/error.dart';
import 'package:ez_backend/ui/stand_list/list.dart';

class AppRootScreen extends StatelessWidget {
  const AppRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppConfigBloc, AppConfigState>(
        listenWhen: (prevState, newState) => prevState != newState,
        listener: (context, event) {
          switch (event.value) {
            case AppConfigStateValue.ready:
              {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const StandListScreen()));
              }
            case AppConfigStateValue.error:
              {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ErrorScreen()));
              }
            case _:
              {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SplashScreen()));
              }
          }
        },
        child: const SplashScreen());
    // return BlocBuilder<AppConfigBloc, AppConfigState>(
    //     buildWhen: (prevState, newState) => prevState != newState,
    //     builder: (context, event) => switch (event.value) {
    //           AppConfigStateValue.ready => const StandListScreen(),
    //           AppConfigStateValue.error => const ErrorScreen(),
    //           _ => const SplashScreen()
    //         });
  }
}
