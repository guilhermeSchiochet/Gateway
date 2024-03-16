class HttpRequestError implements Exception {
  final String? message;
  final dynamic data;
  final int statusCode;

  HttpRequestError(this.statusCode, this.message, this.data);

  @override
  String toString() {
    return "HttpRequestError: $message";
  }
}