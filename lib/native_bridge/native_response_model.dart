import 'package:flutter/services.dart';

class NativeResponseModel<T> {
  NativeResponseModel({required this.isSuccess, this.data, this.error});

  final bool isSuccess;
  final T? data;
  final PlatformException? error;
}
