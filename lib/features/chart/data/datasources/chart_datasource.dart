import 'package:dio/dio.dart';
import 'package:radar_emas/core/network/base_response.dart';
import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';

class ChartDatasource {
  final LogamMuliaApi _api;

  ChartDatasource(this._api);

  Future<BaseResponse<List<GoldPriceDto>>> getPrices() async {
    try {
      final response = await _api.getPrices();
      if (response.success && response.data != null) {
        final rawList = response.data as List<dynamic>;
        final dtos = rawList
            .map((e) => GoldPriceDto.fromJson(e as Map<String, dynamic>))
            .toList();
        return BaseResponse(
          success: true,
          data: dtos,
          count: response.count,
          timestamp: response.timestamp,
          cached: response.cached,
        );
      }
      return BaseResponse(
        success: false,
        message: response.message ?? 'Data tidak tersedia',
      );
    } on DioException catch (e) {
      return BaseResponse(
        success: false,
        message: e.message ?? 'Gagal mengambil data harga',
      );
    }
  }
}
