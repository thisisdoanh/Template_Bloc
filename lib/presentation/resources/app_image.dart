class AppImage {
  AppImage._();

  static const String _internalPathSvg = 'assets/icons/';
  static const String _internalPathPng = 'assets/images/';

  static String getSvgPath(String fileName) {
    if (fileName.contains('.svg')) {
      return '$_internalPathSvg$fileName';
    }
    return '$_internalPathSvg$fileName.svg';
  }

  static String getPngPath(String fileName) {
    if (fileName.contains('.png')) {
      return '$_internalPathPng$fileName';
    }
    return '$_internalPathPng$fileName.png';
  }
}
