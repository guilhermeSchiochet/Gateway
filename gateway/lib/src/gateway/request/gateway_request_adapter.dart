import 'package:gateway/src/gateway/request/gateway_request_orchestrator.dart';

abstract class GatewayRequestAdapter {
  Future<Map<String, dynamic>> call (GatewayRequestOrchestrator dto);
}