// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$productsAtom =
      Atom(name: '_HomeViewModelBase.products', context: context);

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$limitAtom =
      Atom(name: '_HomeViewModelBase.limit', context: context);

  @override
  List<ProductModel> get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(List<ProductModel> value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$isPageLoadigAtom =
      Atom(name: '_HomeViewModelBase.isPageLoadig', context: context);

  @override
  bool get isPageLoadig {
    _$isPageLoadigAtom.reportRead();
    return super.isPageLoadig;
  }

  @override
  set isPageLoadig(bool value) {
    _$isPageLoadigAtom.reportWrite(value, super.isPageLoadig, () {
      super.isPageLoadig = value;
    });
  }

  late final _$_fetchProductsAsyncAction =
      AsyncAction('_HomeViewModelBase._fetchProducts', context: context);

  @override
  Future<void> _fetchProducts() {
    return _$_fetchProductsAsyncAction.run(() => super._fetchProducts());
  }

  late final _$_fetchProductsItemAsyncAction =
      AsyncAction('_HomeViewModelBase._fetchProductsItem', context: context);

  @override
  Future<void> _fetchProductsItem() {
    return _$_fetchProductsItemAsyncAction
        .run(() => super._fetchProductsItem());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
limit: ${limit},
isPageLoadig: ${isPageLoadig}
    ''';
  }
}
