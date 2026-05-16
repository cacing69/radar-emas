import 'package:dio/dio.dart';
import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/core/network/parse_helper.dart';
import 'package:radar_emas/features/chart/data/dto/source_dto.dart';
import 'package:radar_emas/features/chart/data/dto/sources_response.dart';
import 'package:radar_emas/features/chart/domain/datasources/source_remote_datasource.dart';

class SourceRemoteDatasourceImpl implements SourceRemoteDatasource {
  final LogamMuliaApi _api;

  const SourceRemoteDatasourceImpl(this._api);

  @override
  Future<List<SourceDto>> getSources() async {
    try {
      final httpResponse = await _api.getSources();
      final response = SourcesResponse.fromJson(httpResponse.data);

      return response.data.parseEach(
        SourceDto.fromJson,
        label: 'SourceRemoteDatasource',
      );
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch sources');
    }
  }
}
