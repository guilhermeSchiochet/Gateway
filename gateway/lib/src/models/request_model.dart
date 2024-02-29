class RequestModel {
  final String url;
  final String method;
  final dynamic data;

  RequestModel({required this.url, required this.method, this.data});
}