import 'package:vexana/vexana.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instace;
  static ProjectNetworkManager get instance {
    _instace ??= ProjectNetworkManager._init();

    return _instace!;
  }

  ProjectNetworkManager._init();

  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/';
  static const int _timeout = 30000;

  late INetworkManager networkManager = NetworkManager(
      options: BaseOptions(
          baseUrl: _baseUrl,
          followRedirects: false,
          receiveTimeout: _timeout,
          sendTimeout: _timeout));
}
