import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CommonHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['platform'] = kIsWeb ? 'web' : defaultTargetPlatform;
    super.onRequest(options, handler);
  }
}
