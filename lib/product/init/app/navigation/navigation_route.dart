import 'package:fake_store/feature/shop/detail/detail_view.dart';
import 'package:fake_store/feature/shop/home/view/home_view.dart';
import 'package:fake_store/feature/shop/tab/shop_tab_view.dart';
import 'package:fake_store/product/init/app/navigation/navigation_enums.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (NavigationEnums.home.normalValue(settings.name)) {
      case NavigationEnums.deafult:
        return _normalNavigate(ShopTabView());
      case NavigationEnums.home:
        return _normalNavigate(const HomeView());
      case NavigationEnums.detail:
        return _normalNavigate(
          DetailView(id: int.parse(settings.arguments.toString()).toInt()),
        );

      default:
        throw Exception('$this not found');
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget,
      {RouteSettings? settings, bool isFullScreen = false}) {
    return MaterialPageRoute(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: isFullScreen);
  }
}
