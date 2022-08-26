import 'package:fake_store/core/init/constants/app_constants.dart';
import 'package:fake_store/core/init/constants/language_constants.dart';
import 'package:fake_store/feature/shop/tab/shop_tab_view.dart';
import 'package:fake_store/product/init/app/app_init.dart';

import 'package:fake_store/product/init/app/navigation/navigation_manager.dart';
import 'package:fake_store/product/init/app/navigation/navigation_route.dart';
import 'package:fake_store/product/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  AppInitiliaze();
  runApp(EasyLocalization(
    startLocale: LanguageConstants.instance.enLocale,
    supportedLocales: LanguageConstants.instance.supportedLocales,
    path: AppConstants.ASSETS_LANG_PATH,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.creatTheme(AppThemeLight()),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: ShopTabView(),
          onGenerateRoute: NavigationRoute().generateRoute,
          navigatorKey: NavigationManager.instance.navigatorKey,
        );
      },
    );
  }
}
