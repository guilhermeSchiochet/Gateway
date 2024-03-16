import 'package:flutter_test/flutter_test.dart';
import 'package:gateway/src/gateway.dart';

void main() {
  test('ensure request returns data from atende.net', () async {
    dynamic response = await GatewayConnector.call(
      GatewayCallDto(
        url: 'https://kitsu.io/api/edge/anime/1',
        typeRequest: GatewayTypeRequest.GET
      )
    );
 
    expect(response.statusCode, 200);
  });
}