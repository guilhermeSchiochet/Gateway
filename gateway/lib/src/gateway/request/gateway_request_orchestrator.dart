import 'package:gateway/src/adapter/query_string_adapter/protocol/query_string_adapter.dart';
import 'package:gateway/src/gateway/gateway_call_dto.dart';
import 'package:gateway/src/gateway/gateway_type_request.dart';

class GatewayRequestOrchestrator {
  final QueryStringAdapter _queryStringAdapter;
  
  GatewayCallDto? _dto;

  GatewayRequestOrchestrator(this._queryStringAdapter );

  void setCallDto(GatewayCallDto call) {
    _dto = call;
  }

  GatewayCallDto getCallDto() {
    if(_dto == null) throw ('GatewayRequestOrchestrator: call dto not set');
    return _dto!;
  }

  String getCompleteUrl() {
    return getCallDto().getUrl();
  }
  
  GatewayTypeRequest gettypeRequest() {
    return getCallDto().getTypeRequest();
  }

  String getQueryString() {
    if(getCallDto().hasQueryString()) {
      return _queryStringAdapter.fromMap(getCallDto().getQueryString()!);
    }
    return '';
  }

  String? getBody() {
    if(getCallDto().hasBody()) {
      return _queryStringAdapter.fromMap(getCallDto().getBody()!);
    }
    return null;
  }
}