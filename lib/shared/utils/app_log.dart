import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLog {
  static Logger logger = Logger(printer: PrettyPrinter());

  static Logger loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0, errorMethodCount: 0));

  static void debug(dynamic message, {String tag = 'Debug'}) {
    if (kDebugMode) {
      loggerNoStack.d(message, error: tag, stackTrace: null);
    }
  }

  static void info(dynamic message, {String tag = 'Info'}) {
    if (kDebugMode) {
      loggerNoStack.i(message, error: tag, stackTrace: null);
    }
  }

  static void warning(dynamic message, {String tag = 'Warning'}) {
    if (kDebugMode) {
      loggerNoStack.w(message, error: tag);
    }
  }

  static void error(dynamic message, {String tag = 'Error'}) {
    if (kDebugMode) {
      loggerNoStack.e(message, error: tag);
    }
  }
}
