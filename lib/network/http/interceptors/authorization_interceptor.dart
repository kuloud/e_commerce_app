import 'package:dio/dio.dart';
import 'package:e_commerce_app/global.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();
  final _shared = GetIt.instance.get<SharedPreferences>();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = _shared.getString(kAccessToken);
    if (token != null) {
      options.headers[kToken] = token;
    }
    super.onRequest(options, handler);
  }
}
