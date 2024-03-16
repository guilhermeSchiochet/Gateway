import 'dart:convert';
import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_error.dart';
import 'package:gateway/src/services/gateway_net_message.dart';
import 'package:gateway/src/services/gateway_request_adapter_decorator.dart';

class GatewayRequestAdapterErrorHandlerDecorator extends GatewayRequestAdapterDecorator {
  GatewayRequestAdapterErrorHandlerDecorator(super.httpRequestAdapter);

  @override
  Future<String> callGet(String url, {Map<String, String>? headers}) async {
    try {
      return await super.callGet(url, headers: headers);
    } on HttpRequestError catch(err) {
      throw _catchError(err);
    }
  }
  
  @override
  Future<String> callPost(String url, {data, Map<String, String>? headers}) async {
    try {
      return await super.callPost(url, data: data, headers: headers);
    } on HttpRequestError catch(err) {
      throw _catchError(err);
    }
  }
  
  Exception _catchError(HttpRequestError err) {
    if(err.data != null) {
      Map<String, dynamic> message = json.decode(err.data);
      return GatewayMessage.fromMap(message['retorno']);
    }
    return err;
  }
}