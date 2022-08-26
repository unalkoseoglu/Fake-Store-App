import 'package:flutter/material.dart';

abstract class INavigationManager {
  Future<T?> navigateToPage<T>({required String path, Object? data});
  Future<T?> navigateToPageClear<T>({required String path, Object? data});
}

class NavigationManager implements INavigationManager {
  static NavigationManager? _instance;
  static NavigationManager get instance {
    _instance ??= NavigationManager._init();
    return _instance!;
  }

  NavigationManager._init();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<T?> navigateToPage<T>({required String path, Object? data}) async {
    return await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<T?> navigateToPageClear<T>(
      {required String path, Object? data}) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
        path, (Route<dynamic> route) => false,
        arguments: data);
  }
}
