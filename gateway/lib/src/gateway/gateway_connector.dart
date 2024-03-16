import 'package:gateway/src/factory/adapter/http_query_string_adapter_factory.dart';
import 'package:gateway/src/factory/gateway/gateway_request_adapter_error_handler_decorator_factory.dart';
import 'package:gateway/src/gateway/gateway_call_dto.dart';
import 'package:gateway/src/gateway/request/gateway_request.dart';
import 'package:gateway/src/gateway/request/gateway_request_orchestrator.dart';
import 'package:gateway/src/services/gateway_request_adapter_decorator.dart';
import 'package:gateway/src/services/gateway_response_validator.dart';

class GatewayConnector {

  static call(GatewayCallDto dto ) async {
    final orchestrator = _createOrchestrator(dto);

    final requestAdapter = await _createRequestAdapter(orchestrator);
    final GatewayResponseValidator atendenetResponsevalidator = GatewayResponseValidator();
    final request = GatewayRequest( atendenetResponsevalidator, requestAdapter );
    return await request.call(orchestrator);
  }

  static Future<GatewayRequestAdapterDecorator> _createRequestAdapter(GatewayRequestOrchestrator orchestrator) async {
    return GatewayRequestAdapterErrorHandlerDecoratorFactory.make();
  }

  static GatewayRequestOrchestrator _createOrchestrator(GatewayCallDto dto) {
    final requestOrchestrator = GatewayRequestOrchestrator(
      HttpQueryStringAdapterFactory.make(), 
    );
    requestOrchestrator.setCallDto(dto);
    return requestOrchestrator;
  }
}