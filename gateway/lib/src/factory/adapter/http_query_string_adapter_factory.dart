import 'package:gateway/src/adapter/query_string_adapter/http_query_string_adapter.dart';
import 'package:gateway/src/adapter/query_string_adapter/protocol/query_string_adapter.dart';

class HttpQueryStringAdapterFactory {
  static QueryStringAdapter make() {
    return HttpQueryStringAdapter();
  }
}