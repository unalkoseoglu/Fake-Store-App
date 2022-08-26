import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';

class AppInitiliaze {
  Future<void> initBeforeAppStart() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    _closedLocalization();
  }

  void _closedLocalization() {
    EasyLocalization.logger.enableLevels = [
      LevelMessages.error,
      LevelMessages.warning
    ];
  }
}
