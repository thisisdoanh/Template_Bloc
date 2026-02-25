import 'package:dio/dio.dart';
import 'package:template_bloc/global.dart';
import 'package:template_bloc/shared/common/error_entity/error_entity.dart';
import 'package:template_bloc/shared/extension/context.dart';
import 'package:template_bloc/shared/utils/app_log.dart';

class ErrorConverter {
  static ErrorEntity convert(dynamic exception, [StackTrace? stacktrace]) {
    if (exception is ErrorEntity) {
      return exception;
    }

    if (exception is DioException) {
      final type = exception.type;

      switch (type) {
        case DioExceptionType.unknown:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ErrorEntity(message: Global.instance.context.l10n.timeoutErrorOccurred);
        default:
      }
    }

    AppLog.error('$exception $stacktrace', tag: "ErrorConverter");
    return ErrorEntity(message: exception.toString());
  }
}
