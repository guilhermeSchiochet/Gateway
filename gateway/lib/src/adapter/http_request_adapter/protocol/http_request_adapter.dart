abstract class HttpRequestAdapter {
  Future<String> callGet(String url, { Map<String, String>? headers });
  Future<String> callPost(String url, { dynamic data, Map<String, String>? headers });
}