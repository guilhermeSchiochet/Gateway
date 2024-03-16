import 'package:gateway/src/gateway/gateway_type_request.dart';

class GatewayCallDto {
  final String url;
  final Map<String, dynamic>? body;
  final GatewayTypeRequest typeRequest;
  final Map<String, dynamic>? queryString;

  GatewayCallDto({
    required this.url,
    this.body,
    this.queryString,
    this.typeRequest = GatewayTypeRequest.POST,
  });

  String getUrl() {
    return url;
  }

  GatewayTypeRequest getTypeRequest() {
    return typeRequest;
  }

  Map<String, dynamic>? getBody() {
    return body;
  }

  bool hasBody() {
    return body != null;
  }

  Map<String, dynamic>? getQueryString() {
    return queryString;
  }

  bool hasQueryString() {
    return queryString != null;
  }
}