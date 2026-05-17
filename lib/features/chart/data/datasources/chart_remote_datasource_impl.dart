import 'package:dio/dio.dart';
import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/core/network/parse_helper.dart';
import 'package:radar_emas/features/chart/data/dto/chart_prices_response.dart';
import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';
import 'package:radar_emas/features/chart/data/dto/source_dto.dart';
import 'package:radar_emas/features/chart/data/dto/sources_response.dart';
import 'package:radar_emas/features/chart/domain/datasources/chart_remote_datasource.dart';
import 'package:radar_emas/features/chart/domain/entities/price_history_params.dart';

class ChartRemoteDatasourceImpl implements ChartRemoteDatasource {
  final LogamMuliaApi _api;

  const ChartRemoteDatasourceImpl(this._api);

  @override
  Future<List<SourceDto>> getSources() async {
    try {
      final httpResponse = await _api.getSources();
      final response = SourcesResponse.fromJson(httpResponse.data);
      return response.data.parseEach(
        SourceDto.fromJson,
        label: 'ChartRemoteDatasource',
      );
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch sources');
    }
  }

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

  @override
  Future<List<GoldPriceDto>> getPriceHistories(
    PriceHistoryParams params,
  ) async {
    try {
      final queries = _buildQueries(params);
      final httpResponse = await _api.getPriceHistories(
        params.source,
        queries,
      );
      final response = ChartPricesResponse.fromJson(httpResponse.data);

      if (!response.success) {
        throw Exception('Data unavailable');
      }

      return response.data.parseEach(
        GoldPriceDto.fromJson,
        label: 'ChartRemoteDatasource',
      );
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch price history');
    }
  }

  Map<String, dynamic> _buildQueries(PriceHistoryParams params) {
    return {
      'length': params.length,
      if (params.weight != null) 'weight': params.weight,
      if (params.material != null) 'material': params.material,
      if (params.materialType != null) 'materialType': params.materialType,
    };
  }
}
