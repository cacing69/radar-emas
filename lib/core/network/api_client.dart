import 'package:dio/dio.dart';

class ApiClient {
  static final Map<String, ApiClient> _instances = {};

  final Dio dio;

  ApiClient._(this.dio);

  factory ApiClient.create(String baseUrl) {
    if (_instances.containsKey(baseUrl)) {
      return _instances[baseUrl]!;
    }

    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    final client = ApiClient._(dio);
    _instances[baseUrl] = client;
    return client;
  }
}
