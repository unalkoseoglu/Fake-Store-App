import 'package:flutter/material.dart';

class LanguageConstants {
  static LanguageConstants? _instance;
  static LanguageConstants get instance {
    _instance ??= LanguageConstants._init();
    return _instance!;
  }

  LanguageConstants._init();
  final enLocale = const Locale('en', 'US');

  List<Locale> get supportedLocales => [enLocale];
}
