enum NavigationEnums { home, detail, deafult }

extension NavigationConstantsValue on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.deafult:
        return '/default';
      case NavigationEnums.home:
        return '/home';
      case NavigationEnums.detail:
        return '/detail';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/':
        return NavigationEnums.deafult;
      case '/home':
        return NavigationEnums.home;
      case '/detail':
        return NavigationEnums.detail;

      default:
        throw Exception('$val not found in $this');
    }
  }
}
