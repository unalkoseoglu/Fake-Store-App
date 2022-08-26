import 'package:flutter/material.dart';

import 'colors/color_themes.dart';
import 'text/text_theme.dart';
import 'text/text_theme_dark.dart';
import 'text/text_theme_light.dart';

abstract class ITheme {
  IColors get colors;
  ITextTheme get textTheme;
}

abstract class ThemeManager {
  static ThemeData creatTheme(ITheme theme) => ThemeData(
      cardColor: theme.colors.colorScheme?.onSecondary,
      bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
      brightness: theme.colors.colorScheme?.brightness,
      canvasColor: Colors.red,
      cardTheme: CardTheme(shadowColor: theme.colors.cardShadowColor),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.red),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              onPrimary: theme.colors.colorScheme?.surface,
              primary: theme.colors.colorScheme?.onSecondary)),
      tabBarTheme: TabBarTheme(
          labelPadding: EdgeInsets.zero,
          indicator: const BoxDecoration(),
          labelColor: theme.colors.tabBarSelectedColor,
          unselectedLabelColor: theme.colors.tabBarNormalColor),
      iconTheme: IconThemeData(color: theme.colors.colors.black, size: 24),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: theme.textTheme.subtitle2,
      ),
      hintColor: theme.colors.colors.darkGrey,
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: theme.colors.cursorColor),
      /*  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5, backgroundColor: Colors.red), */
      appBarTheme: AppBarTheme(color: theme.colors.appBarColor, elevation: 0),
      bottomAppBarTheme:
          BottomAppBarTheme(color: theme.colors.bottomAppBarColor),
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      colorScheme: theme.colors.colorScheme);
}

class AppThemeDark extends ITheme {
  @override
  IColors get colors => DarkColors();

  AppThemeDark() {
    textTheme = TextThemeDark(colors.colors.mediumGrey);
  }

  @override
  late final ITextTheme textTheme;
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;

  @override
  AppThemeLight() {
    textTheme = TextThemeLight(colors.textColor);
  }
  @override
  IColors get colors => LightColors();
}
