part of './home_service.dart';

enum _HomePath { categories, product, limit }

extension _HomePathExtension on _HomePath {
  String rawValue() {
    switch (this) {
      case _HomePath.categories:
        return '/products/categories';
      case _HomePath.product:
        return '/products';
      case _HomePath.limit:
        return '/products/?offset=0&';
    }
  }
}
