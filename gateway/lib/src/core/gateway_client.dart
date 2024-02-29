import 'package:dio/dio.dart';
import 'package:gateway/src/models/request_model.dart';
import 'package:gateway/src/models/response_model.dart';
import 'package:gateway/src/models/error_model.dart';

class GatewayClient {
  static GatewayClient? _instance;
  
  late final Dio _dio;

  GatewayClient._() {
    _dio = Dio();
  }

  static GatewayClient get instance {
    _instance ??= GatewayClient._(); 
    return _instance!;
  }

  Future<Object> sendRequest(RequestModel request) async {
    try {
      final response = await _dio.request(
        request.url,
        data: request.data,
        options: Options(
          method: request.method,
        ),
      );

      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        data: response.data,
      );
    } catch (error, stackTrace) {
      return ErrorModel(
        message: 'An error occurred: $error',
        stackTrace: stackTrace.toString(),
      );
    }
  }
}