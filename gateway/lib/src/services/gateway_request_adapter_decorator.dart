import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_adapter.dart';

class GatewayRequestAdapterDecorator implements HttpRequestAdapter {
  final HttpRequestAdapter _httpRequestAdapter;
  
  GatewayRequestAdapterDecorator(this._httpRequestAdapter);
  
  @override
  Future<String> callGet(String url, {Map<String, String>? headers}) async {
    return await _httpRequestAdapter.callGet(url, headers: headers);
  }
  
  @override
  Future<String> callPost(String url, {data, Map<String, String>? headers}) async {
    return await _httpRequestAdapter.callPost(url, headers: headers, data: data);
  }
}