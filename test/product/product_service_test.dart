import 'package:fake_store/feature/shop/home/service/home_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late IHomeService homeService;
  setUp(() {
    homeService = HomeService(NetworkManager(
        options: BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1/')));
  });

  test('fetchProduct - test five elemtes', () async {
    final response = await homeService.fetchProductItem();

    expect(response, isNotEmpty);
  });
}
