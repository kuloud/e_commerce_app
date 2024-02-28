import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/entity/recording_entity.dart';
import 'package:e_commerce_app/network/http/api.dart';

/// Mock Endpoint
class XenoCanto {
  final Api _api;
  static const String kRecordings = '/api/2/recordings';

  XenoCanto(this._api);

  Future<RecordingsResponse> recordings(dynamic params,
      {CancelToken? cancelToken}) async {
    final response = await _api.get('$kRecordings',
        params: params, cancelToken: cancelToken);
    return RecordingsResponse.fromJson(response);
  }
}
