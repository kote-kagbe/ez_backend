import 'package:flutter/material.dart';

import 'package:ez_backend/intercom/app_config/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_backend/intercom/app_config/bloc/app_config_bloc.dart';

class StandListDrawer extends StatelessWidget {
  const StandListDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<AppConfig>();
    return Drawer(

        child: Column(children: [
          const Align(
              alignment: Alignment.topCenter,
              child: DrawerHeader(
                child: Image(
                  image: AssetImage('assets/img/logo.png'),
                ),
              )),
      Expanded(
          child: Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                              ),
                            )
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.palette_outlined,
                                  ),
                                  label: const Text(
                                    'изменить оформление',
                                  )),
                              if (cfg.customColorScheme)
                                IconButton(
                                    tooltip: 'Сбросить цветовую схему',
                                    onPressed: () => context
                                        .read<AppConfigBloc>()
                                        .add(const AppConfigUpdate(
                                            resetColorScheme: true)),
                                    icon: const Icon(
                                      Icons.palette,
                                    ))
                            ]),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ефимов В.П., 2024',)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cfg.appVersion,)
                          ],
                        ),
                      ]))))
    ]));
  }
}
