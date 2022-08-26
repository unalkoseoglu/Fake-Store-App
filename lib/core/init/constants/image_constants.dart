class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  final String discount01 = 'discount_01'.toPNG;
  final String discount02 = 'discount_02'.toPNG;
  final String rubberShoe = 'rubber_shoe'.toPNG;
  final String avatar = 'avatar'.toPNG;

  final _LottiePath lottiePath = _LottiePath();
}

class _LottiePath {
  final String ecommerce = 'ecommerce'.toLottie;
}

extension _ImagePathExtension on String {
  String get toPNG => 'assets/images/img_$this.png';
  String get toLottie => 'assets/lottie/lottie_$this.json';
}
