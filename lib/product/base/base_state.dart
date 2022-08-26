import 'package:vexana/vexana.dart';

import '../init/network/project_notwork_manager.dart';

mixin BaseState {
  INetworkManager get networkManager =>
      ProjectNetworkManager.instance.networkManager;
}
