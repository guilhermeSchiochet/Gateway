import 'package:gateway/src/gateway/request/gateway_request_orchestrator.dart';

abstract class GatewayRequestAdapter<T> {
  Future<T> call (GatewayRequestOrchestrator dto);
}