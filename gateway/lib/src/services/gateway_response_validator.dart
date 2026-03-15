import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_error.dart';
import 'package:gateway/src/services/gateway_interface_response_validator.dart';

class GatewayResponseValidator<T> extends GatewayIResponseValidator<T> {
  GatewayResponseValidator() : super ();

  @override
  void validateResponse(T response) {
    _checkNullOrEmpty(response);
    _checkTagsPresence(response);
  }

  void _checkNullOrEmpty(T response) {
    try {
      if (response.toString().isEmpty) {
        throw Exception('Empty response');
      }
    } catch (error) {
      rethrow;
    }
  }

  void _checkTagsPresence(T response) {
    if(response is Map) {
      try {
        final _response = Map<String, dynamic>.from(response);

        final hasMsg = _containsTag(_response, 'msg');
        final hasSis = _containsTag(_response, 'sis');
        final hasCode = _containsTag(_response, 'code');

        if (hasMsg && hasCode && hasSis) {
          throw _catchError(_response);
        }
      } catch (error) {
        rethrow;
      }
    }
  }

  bool _containsTag(Map<String, dynamic> response, String tag) {
    try {
      if (response.containsKey(tag)) {
        return true;
      }
      return response.values.whereType<Map<String, dynamic>>().any((nestedMap) => nestedMap.containsKey(tag));
    } catch (e) {
      return false;
    }
  }

  HttpRequestError _catchError(Map<String, dynamic> message) {
    try {
      return HttpRequestError(message['code'], message['msg'], message);
    } catch (e) {
      try {
        final map = message.values.whereType<Map<String, dynamic>>().first;
        return HttpRequestError(map['code'], map['msg'], message);
      } catch (e) {
        rethrow;
      }
    }
  }
}