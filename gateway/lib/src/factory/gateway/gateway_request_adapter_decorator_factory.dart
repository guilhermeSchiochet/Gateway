import 'package:gateway/src/factory/adapter/dio_adapter_factory.dart';
import 'package:gateway/src/services/gateway_request_adapter_decorator.dart';

class AtendeNetRequestAdapterDecoratorFactory {
  static GatewayRequestAdapterDecorator make() {
    return GatewayRequestAdapterDecorator(
      DioAdapterAdapterFactory.make(),
    );
  }
}