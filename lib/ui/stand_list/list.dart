import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:ez_backend/intercom/app_config/app_config.dart';
import 'package:ez_backend/ui/stand_list/drawer.dart';
import 'package:ez_backend/intercom/constants/strings.dart';
import 'package:ez_backend/intercom/app_config/color_scheme.dart';

class StandListScreen extends StatelessWidget {
  const StandListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<AppConfig>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{return Future.delayed(Duration(seconds: 4));},
        child: ListView(children: [Text('sd')],)),
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
