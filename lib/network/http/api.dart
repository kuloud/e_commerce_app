import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/config/env.dart';
import 'package:e_commerce_app/network/http/code.dart';
import 'package:e_commerce_app/global.dart';
import 'package:e_commerce_app/network/http/endpoints.dart';
import 'package:e_commerce_app/network/http/exception.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:e_commerce_app/utils/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'endpoints/endpoints.dart';
import 'interceptors/interceptors.dart';

class Api {
  static Api? instance;
  late Dio dio;
  late BaseOptions baseOptions;
  final _shared = GetIt.instance.get<SharedPreferences>();

  Api() {
    baseOptions = BaseOptions(
      baseUrl: Env.inProduction ? Endpoints.kBaseUrl : Endpoints.kBaseDevUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      headers: {"version": "1.0"},
    );
    dio = Dio(baseOptions)
      ..interceptors.addAll([
        AuthorizationInterceptor(),
        LoggerInterceptor(),
        CommonHeaderInterceptor()
      ]);
  }

  static Api getInstance() {
    instance ??= Api();
    return instance!;
  }

  get(url, {options, params, cancelToken, onSendProgress, baseUrl}) async {
    if (!Env.inProduction) {
      try {
        logger.d('data => $url ${jsonEncode(params ?? '{}')}');
      } catch (e) {
        logger.e(e);
      }
    }

    Response response;
    try {
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      } else {
        dio.options.baseUrl = Endpoints.kBaseUrl;
      }

      response = await dio.get(
        url,
        options: options,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      throwIfNot(
          response.statusCode == ApiCode.kCodeSuccess,
          XException.badResponse(
              code: response.statusCode!, msg: response.statusMessage));

      return response.data;
    } on DioException catch (e) {
      logger.e('[post] DioException', error: e);
    } on Exception catch (e) {
      logger.e('[post] Exception', error: e);
    }
  }

  post(url, {options, data, cancelToken, onSendProgress, baseUrl}) async {
    if (!Env.inProduction) {
      try {
        logger.d('data => $url ${jsonEncode(data ?? '{}')}');
      } catch (e) {
        logger.e(e);
      }
    }

    Response response;
    try {
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      } else {
        dio.options.baseUrl = Endpoints.kBaseUrl;
      }

      response = await dio.post(url,
          options: options,
          data: data,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress);
      throwIfNot(
          response.statusCode == ApiCode.kCodeSuccess,
          XException.badResponse(
              code: response.statusCode!, msg: response.statusMessage));

      return response.data;
    } on DioException catch (e) {
      logger.e('[post] DioException', error: e);
    } on Exception catch (e) {
      logger.e('[post] Exception', error: e);
    }
  }

  put(url, {options, data, cancelToken, onSendProgress}) async {
    Response response;
    try {
      dio.options.baseUrl = '';
      dio.options.headers["Content-Type"] = "multipart/form-data";
      response = await dio.put(url,
          options: options,
          data: data,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress);

      logger.d(
          'response------headers-${response.requestOptions}--: ${response.headers}');
      logger.d('response------code---: ${response.statusCode}');
      logger.d('response------data---: ${response.data}');
      return response;
    } on DioException catch (e) {
      logger.e('[put] DioException', error: e);
    } on Exception catch (e) {
      logger.e('[put] Exception', error: e);
    }
  }

  static void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  static XenoCanto get xenoCanto => XenoCanto(getInstance());

  Response handleError(Response response) {
    int code = response.data['code'];
    String? msg = response.data['msg'];
    logger.e('handleError: $code $msg');
    if (code == ApiCode.kCodeTokenInvalid ||
        code == ApiCode.kCodeTokenExpired) {
      _shared.remove('plant_access_token');
      // 跳转登录页
    }

    return response;
  }
}
