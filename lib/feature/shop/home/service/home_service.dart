import 'package:fake_store/feature/shop/home/model/product_model.dart';

import 'package:vexana/vexana.dart';

import '../../../../product/model/query/product_query.dart';

part './home_path.dart';

abstract class IHomeService {
  final INetworkManager _manager;
  IHomeService(this._manager);
  //Future<List<CategoryModel>> fetchCaegories();
  Future<List<ProductModel>> fetchProduct();
  Future<List<ProductModel>> fetchProductItem({int count = 4});
}

class HomeService extends IHomeService {
  HomeService(super.manager);

  @override
  Future<List<ProductModel>> fetchProduct() async {
    final response = await _manager.send<ProductModel, List<ProductModel>>(
        _HomePath.product.rawValue(),
        parseModel: ProductModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }

  @override
  Future<List<ProductModel>> fetchProductItem({int count = 4}) async {
    final response = await _manager.send<ProductModel, List<ProductModel>>(
        _HomePath.limit.rawValue(),
        parseModel: ProductModel(),
        method: RequestType.GET,
        queryParameters:
            Map.fromEntries([ProductQueries.limits.toMapEntry('$count')]));

    return response.data ?? [];
  }
}
