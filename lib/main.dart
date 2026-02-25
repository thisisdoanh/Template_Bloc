import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:template_bloc/app.dart';
import 'package:template_bloc/app_bloc.dart';
import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/flavors.dart';
import 'package:template_bloc/hive_registrar.g.dart';
import 'package:template_bloc/shared/utils/app_log.dart';
import 'package:template_bloc/shared/utils/bloc_observer.dart';
import 'package:template_bloc/shared/utils/share_preference_utils.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.prod,
  );

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDeviceUI();
      Bloc.observer = AppBlocObserver();
      final appDocDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocDir.path);
      Hive.registerAdapters();
      await configureDependencies();
      await Future.wait([getIt<PreferenceUtils>().init()]);

      await _startApp();
    },
    (error, stack) {
      AppLog.error('Error: $error\n$stack', tag: 'Main');
    },
  );
}

void configureDeviceUI() {
  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Android-specific UI configuration
  if (Platform.isAndroid) {
    // Set transparent status and navigation bars
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    // Hide navigation bar initially
    hideSystemNavigationBar();

    // Auto-hide navigation bar if it becomes visible
    SystemChrome.setSystemUIChangeCallback((bool uiVisible) async {
      if (uiVisible) {
        Future<void>.delayed(const Duration(seconds: 3), hideSystemNavigationBar);
      }
    });
  }
}

void hideSystemNavigationBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

Future _startApp() async {
  runApp(
    BlocProvider.value(
      value: getIt<AppBloc>()..add(const AppEvent.loadData()),
      child: const MyApp(),
    ),
  );
}
