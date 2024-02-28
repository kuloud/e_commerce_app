class XException implements Exception {
  int code;
  String msg;

  XException({required this.code, required this.msg});

  factory XException.badResponse({required code, required msg}) =>
      XException(code: code, msg: msg);
}
