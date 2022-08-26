import 'package:fake_store/feature/shop/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/init/app/base/base_view_model.dart';

import '../../../../core/init/constants/image_constants.dart';
import '../../../../product/init/app/navigation/navigation_enums.dart';
import '../../../../product/init/app/navigation/navigation_manager.dart';
import '../model/product_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late IHomeService _homeService;

  List<String> discounts = [
    ImageConstants.instance.discount01,
    ImageConstants.instance.discount02
  ];

  @observable
  List<ProductModel> products = [];
  @observable
  List<ProductModel> limit = [];

  @observable
  bool isPageLoadig = true;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    _homeService = HomeService(networkService.networkManager);
    _fetchProductsItem();
    _fetchProducts();
  }

  @action
  Future<void> _fetchProducts() async {
    products = await _homeService.fetchProduct();
  }

  @action
  Future<void> _fetchProductsItem() async {
    limit = await _homeService.fetchProductItem();
  }

  void sendItemID(int? id) {
    NavigationManager.instance
        .navigateToPage(path: NavigationEnums.detail.rawValue, data: id);
  }

  void selectedImagesID(int? selectedImage, int index) {
    index = selectedImage ?? 0;
  }

  @action
  void _changeLoading() {
    isPageLoadig = !isPageLoadig;
  }
}
