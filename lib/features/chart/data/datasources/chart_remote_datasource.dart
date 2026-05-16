import 'package:dio/dio.dart';
import 'package:radar_emas/core/network/base_response.dart';
import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';

class ChartRemoteDatasource {
  final LogamMuliaApi _api;

  const ChartRemoteDatasource(this._api);

  Future<BaseResponse<List<GoldPriceDto>>> getPrices(String source) async {
    try {
      final response = await _api.getPrices(source);
      final json = response.data as Map<String, dynamic>;
      final base = BaseResponse<dynamic>.fromJson(json, (data) => data);

      if (base.success && base.data != null) {
        final rawList = base.data as List<dynamic>;
        final dtos = rawList
            .map((e) => GoldPriceDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return BaseResponse(
          success: true,
          data: dtos,
          count: base.count,
          timestamp: base.timestamp,
          cached: base.cached,
        );
      }
      return BaseResponse(
        success: false,
        message: base.message ?? 'Data unavailable',
      );
    } on DioException catch (e) {
      return BaseResponse(
        success: false,
        message: e.message ?? 'Failed to fetch prices',
      );
    }
  }
}
