enum ProductQueries { limits }

extension ProductQueriesExtenion on ProductQueries {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case ProductQueries.limits:
        return MapEntry('limit', value);
    }
  }
}
