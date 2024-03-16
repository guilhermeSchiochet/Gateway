import 'package:gateway/src/factory/adapter/dio_adapter_factory.dart';
import 'package:gateway/src/services/gateway_request_adapter_error_handler_decorator.dart';

class GatewayRequestAdapterErrorHandlerDecoratorFactory {
  static GatewayRequestAdapterErrorHandlerDecorator make() {
    return GatewayRequestAdapterErrorHandlerDecorator(
      DioAdapterAdapterFactory.make(),
    );
  }
}