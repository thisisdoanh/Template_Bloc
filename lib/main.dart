import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/app.dart';
import 'package:template_bloc/app_bloc.dart';
import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/flavors.dart';
import 'package:template_bloc/shared/utils/app_log.dart';
import 'package:template_bloc/shared/utils/bloc_observer.dart';

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
      await configureDependencies();

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
