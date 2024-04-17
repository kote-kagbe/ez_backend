import 'package:flutter/material.dart';

import 'package:ez_backend/intercom/app_config/color_scheme.dart';

class AppTheme {
  const AppTheme(
      {this.appTheme, this.errorTheme, this.splashTheme, this.drawerTheme});

  final ThemeData? appTheme, errorTheme, splashTheme, drawerTheme;

  AppTheme setup(AppColorScheme scheme) {
    final app = _appTheme(scheme);
    return AppTheme(
        appTheme: app,
        errorTheme: _errorTheme(app, scheme),
        splashTheme: _splashTheme(app, scheme),
        drawerTheme: _drawerTheme(app, scheme));
  }

  ThemeData? _appTheme(AppColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: scheme.mainBackground,
      colorScheme: ColorScheme.fromSeed(
          background: scheme.mainBackground,
          seedColor: scheme.sideMenuBackground),
      drawerTheme: DrawerThemeData(
        backgroundColor: scheme.sideMenuBackground,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: scheme.sideMenuBackground,
          foregroundColor: scheme.sideMenuItemText),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: scheme.sideMenuItemText),
      ),
    );
  }

  ThemeData? _errorTheme(ThemeData? base, AppColorScheme scheme) {
    return base?.copyWith(
      scaffoldBackgroundColor: scheme.sideMenuBackground,
      colorScheme: ColorScheme.fromSeed(seedColor: scheme.sideMenuBackground),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: scheme.error, fontWeight: FontWeight.bold),
      ),
    );
  }

  ThemeData? _splashTheme(ThemeData? base, AppColorScheme scheme) {
    return base?.copyWith(
      scaffoldBackgroundColor: scheme.sideMenuBackground,
      colorScheme: ColorScheme.fromSeed(seedColor: scheme.sideMenuBackground),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: scheme.sideMenuItemAddText),
      ),
    );
  }

  ThemeData? _drawerTheme(ThemeData? base, AppColorScheme scheme) {
    return base?.copyWith(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((_) => scheme.sideMenuItemHover),
            iconColor: MaterialStateColor.resolveWith(
                (_) => scheme.sideMenuItemAddText),
            foregroundColor: MaterialStateColor.resolveWith(
                (_) => scheme.sideMenuItemAddText)),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: scheme.sideMenuItemAddText),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        foregroundColor:
            MaterialStateColor.resolveWith((_) => scheme.sideMenuItemAddText),
      )),
    );
  }
}
