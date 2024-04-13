import 'package:ez_backend/intercom/app_config/color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/intercom/app_config/app_config.dart';
import 'package:ez_backend/ui/stand_list/drawer.dart';
import 'package:ez_backend/intercom/constants/strings.dart';

class StandListScreen extends StatelessWidget {
  const StandListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<AppConfig>();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('stand list'),
        IconButton(
            onPressed: () {
              cfg.customColorScheme = true;
              cfg.colorScheme = AppColorScheme(
                  sideMenuBackground: AppSchemeColor(Colors.yellow.value));
              context.read<AppConfigBloc>().add(const AppConfigUpdate());
            },
            icon: const Icon(Icons.abc))
      ]),
      drawer: StandListDrawer(),
      appBar: AppBar(
          foregroundColor: cfg.colorScheme.sideMenuItemText,
          backgroundColor: cfg.colorScheme.sideMenuBackground,
          title: Text(
            applicationTitle,
            style: TextStyle(color: cfg.colorScheme.sideMenuItemText),
          )),
    );
  }
}
