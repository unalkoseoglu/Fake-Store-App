import 'package:easy_localization/easy_localization.dart';
import 'package:fake_store/product/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../home/view/home_view.dart';

class _TabModel {
  final Widget page;
  final String title;
  final IconData icon;

  _TabModel(this.page, {required this.title, required this.icon});
}

class TabModels {
  late final List<_TabModel> tabItems;

  TabModels.create() {
    tabItems = [
      _TabModel(const HomeView(),
          title: LocaleKeys.tab_home.tr(), icon: Icons.home),
      _TabModel(Container(color: Colors.red),
          title: LocaleKeys.tab_cart.tr(), icon: Icons.shopping_cart),
      _TabModel(Container(color: Colors.green),
          title: LocaleKeys.tab_notifi.tr(), icon: Icons.notifications),
      _TabModel(Container(color: Colors.blue),
          title: LocaleKeys.tab_profile.tr(), icon: Icons.person)
    ];
  }
}
