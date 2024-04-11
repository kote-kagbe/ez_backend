import 'package:ez_backend/intercom/app_config/color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/intercom/app_config/app_config.dart';

class StandListScreen extends StatelessWidget {
  const StandListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('stand list'),
        IconButton(
            onPressed: () {
              context.read<AppConfig>().colorScheme = AppColorScheme(
                  sideMenuBackground: AppSchemeColor(Colors.yellow.value));
              context.read<AppConfigBloc>().add(AppConfigUpdate());
            },
            icon: const Icon(Icons.abc))
      ]),
    );
  }
}
