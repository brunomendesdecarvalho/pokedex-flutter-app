import 'package:dio/dio.dart';

class DioClient {
  final dio = Dio();

  DioClient({required String baseUrl}) {
    dio.options.baseUrl = baseUrl;
  }

  DioClient.withLogs({required String baseUrl}) {
    dio.options.baseUrl = baseUrl;
  }
}
