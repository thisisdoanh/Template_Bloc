import 'package:flutter/material.dart';

import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/presentation/router/router.dart';

class Global {
  Global._privateConstructor();

  static final Global instance = Global._privateConstructor();
  String documentPath = '';
  String temporaryPath = '';
  int androidSdkVersion = 0;
  bool requestedNotificationPermission = false;
  bool isFirstTime = false;

  BuildContext get context => getIt<AppRouter>().navigatorKey.currentContext!;
}
