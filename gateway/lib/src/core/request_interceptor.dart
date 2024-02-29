import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Lógica para interceptar e modificar a solicitação antes de ser enviada
    // options.headers.addAll({'Authorization': 'Bearer your_token'});
    super.onRequest(options, handler);
  }
}
