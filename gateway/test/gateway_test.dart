import 'package:flutter_test/flutter_test.dart';
import 'package:gateway/gateway.dart';

void main() {
  group('GatewayClient', () {
    late GatewayClient gatewayClient;

    setUp(() {
      gatewayClient = GatewayClient.instance;
    });

    test('sendRequest should return a ResponseModel when successful', () async {
      // Defina as configurações de teste (URL, método, etc.)
      final request = RequestModel(url: 'https://example.com', method: 'GET');

      // Chame o método sendRequest da GatewayClient
      final result = await gatewayClient.sendRequest(request);

      // Verifique se o resultado é uma instância de ResponseModel
      expect(result, isA<ResponseModel>());
    });

    test('sendRequest should return an ErrorModel when an error occurs', () async {
      // Defina as configurações de teste (URL, método, etc.)
      final request = RequestModel(url: 'https://invalid-url', method: 'GET');

      // Chame o método sendRequest da GatewayClient
      final result = await gatewayClient.sendRequest(request);

      // Verifique se o resultado é uma instância de ErrorModel
      expect(result, isA<ErrorModel>());
    });
  });
}
