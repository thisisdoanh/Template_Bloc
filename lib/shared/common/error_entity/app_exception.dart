class AppException implements Exception {
  const AppException({required this.message, this.code});

  factory AppException.network() =>
      const AppException(message: 'Lỗi kết nối mạng, vui lòng thử lại');

  factory AppException.unauthorized() =>
      const AppException(message: 'Phiên đăng nhập hết hạn', code: 401);

  factory AppException.unknown(Object e) => AppException(message: e.toString());

  final String message;
  final int? code;

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}
