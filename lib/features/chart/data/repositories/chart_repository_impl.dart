import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/data/mappers/gold_price_mapper.dart';
import 'package:radar_emas/features/chart/domain/datasources/chart_remote_datasource.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/entities/price_history_params.dart';
import 'package:radar_emas/features/chart/domain/repositories/chart_repository.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartRemoteDatasource _datasource;
  final GoldPriceMapper _mapper;

  const ChartRepositoryImpl(this._datasource, this._mapper);

  @override
  Future<Result<List<GoldPrice>>> getPrices(String source) async {
    try {
      final dtos = await _datasource.getPrices(source);
      final entities = _mapper.toEntityList(dtos);
      return Result.success(entities);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<GoldPrice>>> getPriceHistories(
    PriceHistoryParams params,
  ) async {
    try {
      final dtos = await _datasource.getPriceHistories(params);
      final entities = _mapper.toEntityList(dtos);
      return Result.success(entities);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }
}
