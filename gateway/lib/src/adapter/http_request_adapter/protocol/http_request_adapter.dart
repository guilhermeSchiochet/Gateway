abstract class HttpRequestAdapter<T> {
  Future<T> callGet(String url, { Map<String, String>? headers });
  Future<T> callPost(String url, { dynamic data, Map<String, String>? headers });
}