import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Lógica para interceptar e modificar a resposta após ser recebida
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Lógica para interceptar e tratar erros de resposta
    super.onError(err, handler);
  }
}
