import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:ez_backend/ui/constants/colors.dart';

part 'color_scheme.g.dart';

@JsonSerializable()
class AppSchemeColor extends Color {
  const AppSchemeColor(super.value);

  factory AppSchemeColor.fromJson(Map<String, dynamic> json) =>
      _$AppSchemeColorFromJson(json);
  Map<String, dynamic> toJson() => _$AppSchemeColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AppColorScheme {
  const AppColorScheme({
    this.mainBackground = const AppSchemeColor(0xfff8f8f8),
    this.mainElementBackground = const AppSchemeColor(0xffffffff),
    this.mainElementHover = const AppSchemeColor(0xfff3f4f8),
    this.mainText = const AppSchemeColor(0xff000000),
    //
    this.sideMenuBackground = const AppSchemeColor(systemColorValue),
    this.sideMenuItemHover = const AppSchemeColor(0xff3e5266),
    this.sideMenuItemText = const AppSchemeColor(0xffe9ebec),
    this.sideMenuItemAddText = const AppSchemeColor(0xff98b2ca),
    this.sideMenuItemAddTextBackground = const AppSchemeColor(0xff293a4a),
    this.sideMenuItemAddTextBackgroundHover = const AppSchemeColor(0xff314454),
    //
    this.highlight = const AppSchemeColor(0xffff9c6c),
    this.error = const AppSchemeColor(systemErrorColorValue),
    this.inactive = const AppSchemeColor(0xff909090),
  });

  final AppSchemeColor mainBackground;
  final AppSchemeColor mainElementBackground;
  final AppSchemeColor mainElementHover;
  final AppSchemeColor mainText;
  //
  final AppSchemeColor sideMenuBackground;
  final AppSchemeColor sideMenuItemHover;
  final AppSchemeColor sideMenuItemText;
  final AppSchemeColor sideMenuItemAddText;
  final AppSchemeColor sideMenuItemAddTextBackground;
  final AppSchemeColor sideMenuItemAddTextBackgroundHover;
  //
  final AppSchemeColor highlight;
  final AppSchemeColor error;
  final AppSchemeColor inactive;

  factory AppColorScheme.fromJson(Map<String, dynamic> json) =>
      _$AppColorSchemeFromJson(json);
  Map<String, dynamic> toJson() => _$AppColorSchemeToJson(this);
}
