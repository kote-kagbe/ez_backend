import 'package:flutter/material.dart';

import 'package:ez_backend/intercom/app_config/color_scheme.dart';

ThemeData appTheme(AppColorScheme scheme){
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
      foregroundColor: scheme.sideMenuItemText
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: scheme.sideMenuItemText),
    ),
  );
}

ThemeData errorTheme(AppColorScheme scheme){
  return appTheme(scheme).copyWith(
    scaffoldBackgroundColor: scheme.error,
    colorScheme: ColorScheme.fromSeed(
        seedColor: scheme.error),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: scheme.mainText),
    ),
  );
}

ThemeData splashTheme(AppColorScheme scheme){
  return appTheme(scheme).copyWith(
    scaffoldBackgroundColor: scheme.sideMenuBackground,
    colorScheme: ColorScheme.fromSeed(
        seedColor: scheme.sideMenuBackground
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: scheme.sideMenuItemAddText),
    ),
  );
}

ThemeData drawerTheme(AppColorScheme scheme){
  return appTheme(scheme).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((_) => scheme .sideMenuItemHover),
        iconColor: MaterialStateColor.resolveWith((_) => scheme.sideMenuItemAddText),
        foregroundColor: MaterialStateColor.resolveWith((_) => scheme.sideMenuItemAddText)
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: scheme.sideMenuItemAddText),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith((_) => scheme.sideMenuItemAddText),
      )
    ),
  );
}