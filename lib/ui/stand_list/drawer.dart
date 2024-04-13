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
      Container(
          color: cfg.colorScheme.sideMenuBackground,
          child: const Align(
              alignment: Alignment.topCenter,
              child: DrawerHeader(
                child: Image(
                  image: AssetImage('assets/img/logo.png'),
                ),
              ))),
      Expanded(
          child: Container(
              padding: const EdgeInsets.only(bottom: 8),
              color: cfg.colorScheme.sideMenuBackground,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: cfg.colorScheme.sideMenuBackground,
                              ),
                            )
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      overlayColor:
                                          MaterialStateColor.resolveWith((_) =>
                                              cfg.colorScheme
                                                  .sideMenuItemHover)),
                                  icon: Icon(
                                    Icons.palette_outlined,
                                    color: cfg.colorScheme.sideMenuItemAddText,
                                  ),
                                  label: Text(
                                    'изменить оформление',
                                    style: TextStyle(
                                        color: cfg
                                            .colorScheme.sideMenuItemAddText),
                                  )),
                              if (cfg.customColorScheme)
                                IconButton(
                                    tooltip: 'Сбросить цветовую схему',
                                    onPressed: () => context
                                        .read<AppConfigBloc>()
                                        .add(const AppConfigUpdate()),
                                    icon: Icon(
                                      Icons.palette,
                                      color:
                                          cfg.colorScheme.sideMenuItemAddText,
                                    ))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ефимов В.П., 2024',
                                style: TextStyle(
                                    color: cfg.colorScheme.sideMenuItemAddText))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cfg.appVersion,
                                style: TextStyle(
                                    color: cfg.colorScheme.sideMenuItemAddText))
                          ],
                        ),
                      ]))))
    ]));
  }
}
