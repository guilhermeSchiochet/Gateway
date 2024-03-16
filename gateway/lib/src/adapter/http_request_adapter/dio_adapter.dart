import 'package:dio/dio.dart';
import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_adapter.dart';
import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_error.dart';

/// Classe responsável por realizar chamadas HTTP GET e POST utilizando a biblioteca Dio.
/// Implementa a interface HttpRequestAdapter para fornecer uma abordagem padronizada para as chamadas HTTP.
class DioAdapter implements HttpRequestAdapter {
 final dio = Dio();
  
 /// Realiza uma chamada HTTP GET para a URL especificada.
 ///
 /// @param url A URL para a qual a chamada GET será realizada.
 /// @param headers (Opcional) Um Mapa de cabeçalhos HTTP a serem incluídos na solicitação.
 /// @return Uma Future<String> representando a resposta da chamada GET.
 @override
 Future<String> callGet(String url, { Map<String, String>? headers }) async {    
    try {
      final response = await dio.get(
        url, 
        options: Options(
          responseType: ResponseType.plain, 
          headers: headers
        )
      );
      return response.data;
    } on DioException catch(err) {
      throw _catchError(err);
    }
 }

 /// Realiza uma chamada HTTP POST para a URL especificada com os dados fornecidos.
 ///
 /// @param url A URL para a qual a chamada POST será realizada.
 /// @param data Os dados a serem enviados na solicitação POST.
 /// @param headers (Opcional) Um Mapa de cabeçalhos HTTP a serem incluídos na solicitação.
 /// @return Uma Future<String> representando a resposta da chamada POST.
 @override
 Future<String> callPost(String url, { dynamic data, Map<String, String>? headers }) async {
    try {
      final response = await dio.post(
        url, 
        data: data, 
        options: Options(
          responseType: ResponseType.plain, 
          headers: headers
        )
      );
      return response.data;
    } on DioException catch(err) {
      throw _catchError(err);
    }
 }

 /// Trata erros de chamadas HTTP, convertendo-os em uma exceção HttpRequestError.
 ///
 /// @param err A exceção DioException capturada durante a chamada HTTP.
 /// @return Uma exceção HttpRequestError contendo detalhes sobre o erro.
 HttpRequestError _catchError(DioException err) {
    if(err.response == null) throw ('DioAdapter: ocorreu um erro de comunicação inesperado.');
    return HttpRequestError(err.response!.statusCode!, err.message, err.response?.data);
 }
}