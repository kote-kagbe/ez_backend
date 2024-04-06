import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppConfigBloc>().add(AppConfigUpdate());
    return Scaffold(
        body: Container(
      color: const Color(0xff2c3e50),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  'инициализация...',
                  style: TextStyle(color: Color(0xffe9ebec)),
                ))
          ],
        )
      ]),
    ));
  }
}
