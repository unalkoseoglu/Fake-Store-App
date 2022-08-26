import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class ServiceHelper {
  void showMessage(
      GlobalKey<ScaffoldState>? scaffoldKey, IErrorModel? errorModel) {}
}
