import 'package:gateway/src/adapter/http_request_adapter/protocol/http_request_error.dart';
import 'package:gateway/src/services/gateway_interface_response_validator.dart';

class GatewayResponseValidator extends GatewayIResponseValidator {
  GatewayResponseValidator() : super ();

  @override
  void validateResponse(Map<String, dynamic> response) {
    _checkNullOrEmpty(response);
    _checkTagsPresence(response);
  }

  void _checkNullOrEmpty(Map<String, dynamic> response) {
    try {
      if (response.isEmpty) {
        throw Exception('Empty response');
      }
    } catch (error) {
      rethrow;
    }
  }

  void _checkTagsPresence(Map<String, dynamic> response) {
    try {
      final hasMsg = _containsTag(response, 'msg');
      final hasSis = _containsTag(response, 'sis');
      final hasCode = _containsTag(response, 'code');

      if (hasMsg && hasCode && hasSis) {
        throw _catchError(response);
      }
    } catch (error) {
      rethrow;
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