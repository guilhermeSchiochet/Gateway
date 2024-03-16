class GatewayMessage implements Exception {
  final String message;
  final String code;

  GatewayMessage({ required this.message, required this.code});

  String getMessage() {
    return message;
  }

  String getCode() {
    return code;
  }

  factory GatewayMessage.fromMap(Map<String, dynamic> data) {
    return GatewayMessage(
      message: data['msg'].toString(),
      code: data['code'].toString(),
    );
  }
}