import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/app_config.dart';
import 'package:ez_backend/ui/stand_list/drawer.dart';
import 'package:ez_backend/intercom/constants/strings.dart';
import 'package:ez_backend/ui/application/theme.dart';

class StandListScreen extends StatelessWidget {
  const StandListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<AppConfig>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{return Future.delayed(Duration(seconds: 4));},
        child: ListView(children: [Text('sd')],)),
      drawer: Theme(data: drawerTheme(cfg.colorScheme), child:  StandListDrawer()),
      appBar: AppBar(
          title: const Text(
            applicationTitle,
          )),
    );
  }
}
