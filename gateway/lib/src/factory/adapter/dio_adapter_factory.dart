import 'package:gateway/src/adapter/http_request_adapter/dio_adapter.dart';
import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_adapter.dart';

class DioAdapterAdapterFactory {
  static HttpRequestAdapter make() {
    return DioAdapter();
  }
}