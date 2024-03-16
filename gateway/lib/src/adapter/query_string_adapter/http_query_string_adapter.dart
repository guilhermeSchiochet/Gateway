import 'package:gateway/src/adapter/query_string_adapter/protocol/query_string_adapter.dart';
import 'package:http_query_string/http_query_string.dart';

/// Classe responsável pela conversão de um Mapa de dados em uma string de consulta HTTP.
/// Implementa a interface QueryStringAdapter para fornecer uma abordagem padronizada para a geração de strings de consulta.
class HttpQueryStringAdapter implements QueryStringAdapter {
 /// Converte um Mapa de dados em uma string de consulta HTTP.
 ///
 /// @param queryData O Mapa de dados a ser convertido.
 /// @return Uma string representando a string de consulta HTTP gerada a partir dos dados fornecidos.
 @override
 String fromMap(Map<String, dynamic> queryData) {
    return Encoder().convert(queryData);
 }
}
