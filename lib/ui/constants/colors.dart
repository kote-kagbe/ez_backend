import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'colors.g.dart';

@JsonSerializable()
class AppSchemeColor extends Color {
  const AppSchemeColor(super.value);
  factory AppSchemeColor.fromJson(Map<String, dynamic> json) =>
      _$AppSchemeColorFromJson(json);
  Map<String, dynamic> toJson() => _$AppSchemeColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AppColorScheme {
  AppColorScheme(
      [this.mainBackground = const AppSchemeColor(0xfff8f8f8),
      this.mainElementBackgound = const AppSchemeColor(0xffffffff),
      this.mainElementHover = const AppSchemeColor(0xfff3f4f8),
      this.mainText = const AppSchemeColor(0xff000000),
      //
      this.sideMenuBackground = const AppSchemeColor(0xff2c3e50),
      this.sideMenuItemHover = const AppSchemeColor(0xff3e5266),
      this.sideMenuItemText = const AppSchemeColor(0xffe9ebec),
      this.sideMenuItemAddText = const AppSchemeColor(0xff98b2ca),
      //
      this.highlight = const AppSchemeColor(0xffff9c6c),
      this.error = const AppSchemeColor(0xffc2140a),
      this.inactive = const AppSchemeColor(0xff909090)]);

  AppSchemeColor mainBackground;
  AppSchemeColor mainElementBackgound;
  AppSchemeColor mainElementHover;
  AppSchemeColor mainText;
  //
  AppSchemeColor sideMenuBackground;
  AppSchemeColor sideMenuItemHover;
  AppSchemeColor sideMenuItemText;
  AppSchemeColor sideMenuItemAddText;
  //
  AppSchemeColor highlight;
  AppSchemeColor error;
  AppSchemeColor inactive;

  factory AppColorScheme.fromJson(Map<String, dynamic> json) =>
      _$AppColorSchemeFromJson(json);
  Map<String, dynamic> toJson() => _$AppColorSchemeToJson(this);
}
