import 'package:template_bloc/shared/common/error_entity/error_entity.dart';

class NetworkErrorEntity extends ErrorEntity {
  NetworkErrorEntity({
    required super.message,
    required this.httpCode,
    required this.code,
  });

  final int httpCode;
  final String code;
}

// class NoInternetErrorEntity extends ErrorEntity {
//   NoInternetErrorEntity() : super(message: 'error.no_internet'.tr());
// }
