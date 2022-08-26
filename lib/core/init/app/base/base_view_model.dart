import 'package:fake_store/product/init/app/navigation/navigation_manager.dart';
import 'package:fake_store/product/init/network/project_notwork_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;

  ProjectNetworkManager networkService = ProjectNetworkManager.instance;
  NavigationManager navigation = NavigationManager.instance;

  void setContext(BuildContext context);
  void init();
}
