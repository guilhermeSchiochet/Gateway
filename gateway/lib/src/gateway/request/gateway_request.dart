import 'dart:convert';
import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_adapter.dart';
import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_error.dart';
import 'package:gateway/src/gateway/gateway_type_request.dart';
import 'package:gateway/src/gateway/request/gateway_request_adapter.dart';
import 'package:gateway/src/gateway/request/gateway_request_orchestrator.dart';
import 'package:gateway/src/services/gateway_net_message.dart';
import 'package:gateway/src/services/gateway_response_validator.dart';

class GatewayRequest implements GatewayRequestAdapter {
  final HttpRequestAdapter _httpRequestAdapter;
  final GatewayResponseValidator _responseValidator;

  GatewayRequest(
    this._responseValidator,
    this._httpRequestAdapter,
  );
  
  @override
  Future<Map<String, dynamic>> call(GatewayRequestOrchestrator request) async {
    final response = await _sendPostRequest(request);
    final parsedResponse = _parseResponse(response);

    _validateResponse(parsedResponse);

    return parsedResponse;
  }

  Future<String> _sendPostRequest(GatewayRequestOrchestrator request) async {
    switch (request.gettypeRequest()) {
      case GatewayTypeRequest.POST:
        return await _httpRequestAdapter.callPost(request.getCompleteUrl(), data: request.getBody()); 
      case GatewayTypeRequest.GET: 
        return await _httpRequestAdapter.callGet(request.getCompleteUrl()); 
    }
  }

  Map<String, dynamic> _parseResponse(String response) {
    return json.decode(response);
  }

  void _validateResponse(Map<String, dynamic> response) {
    try {
      _responseValidator.validateResponse(response);
    } on HttpRequestError catch (err) {
      throw _catchError(err);
    }
  }

  Exception _catchError(HttpRequestError err) {
    try {
      if(err.data is String) {
        final message = json.decode(err.data);
        return GatewayMessage.fromMap(message['retorno']);
      } else {
        return GatewayMessage.fromMap(err.data['retorno']);
      }
    } catch (e) {
      return err;
    }
  }
}