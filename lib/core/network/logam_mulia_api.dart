import 'package:dio/dio.dart';
import 'package:radar_emas/core/network/api_client.dart';
import 'package:radar_emas/core/network/base_response.dart';

class LogamMuliaApi {
  static const _baseUrl = 'https://logam-mulia-api.iamutaki.workers.dev';

  final ApiClient _client;

  LogamMuliaApi() : _client = ApiClient.create(_baseUrl);

  Future<BaseResponse<dynamic>> get(String path) async {
    try {
      final response = await _client.dio.get(path);
      final json = response.data as Map<String, dynamic>;
      return BaseResponse<dynamic>.fromJson(json, (data) => data);
    } on DioException catch (e) {
      return BaseResponse(
        success: false,
        message: e.message ?? 'Failed to fetch data',
      );
    }
  }
}
