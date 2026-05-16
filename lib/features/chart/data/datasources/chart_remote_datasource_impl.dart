import 'package:dio/dio.dart';
import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/core/network/parse_helper.dart';
import 'package:radar_emas/features/chart/data/dto/chart_prices_response.dart';
import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';
import 'package:radar_emas/features/chart/domain/datasources/chart_remote_datasource.dart';

class ChartRemoteDatasourceImpl implements ChartRemoteDatasource {
  final LogamMuliaApi _api;

  const ChartRemoteDatasourceImpl(this._api);

  @override
  Future<List<GoldPriceDto>> getPrices(String source) async {
    try {
      final httpResponse = await _api.getPrices(source);
      final response = ChartPricesResponse.fromJson(httpResponse.data);

      if (!response.success) {
        throw Exception('Data unavailable');
      }

      return response.data.parseEach(
        GoldPriceDto.fromJson,
        label: 'ChartRemoteDatasource',
      );
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch prices');
    }
  }
}
