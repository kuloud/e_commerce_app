import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/config/env.dart';
import 'package:e_commerce_app/network/http/code.dart';
import 'package:e_commerce_app/utils/logger.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!Env.inProduction) {
      try {
        final options = err.requestOptions;
        final requestPath = '${options.baseUrl}${options.path}';
        logger.e('${options.method} request => $requestPath');
        logger.d('Error: ${err.error}, Message: ${err.message}');
      } catch (e) {
        //
      }
    }
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Env.inProduction) {
      try {
        final requestPath = '${options.baseUrl}${options.path}';
        logger.i('${options.method} request => $requestPath');
        logger.d('headers => ${options.headers}');
        // logger.d('queryParameters => ${options.queryParameters}');
        logger.d(
            'data => ${options.data != null ? jsonEncode(options.data) : {}}');
      } catch (e) {
        //
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!Env.inProduction) {
      final options = response.requestOptions;
      final requestPath = '${options.baseUrl}${options.path}';
      if (response.statusCode == ApiCode.kCodeSuccess) {
        try {
          logger.d(
              'response <= $requestPath | Data: ${jsonEncode(response.data)}');
        } catch (e) {
          logger.e('response <= $requestPath | ', error: e);
        }
      } else {
        logger.i('response <= $requestPath StatusCode: ${response.statusCode}');
      }
    }

    return super.onResponse(response, handler);
  }
}
