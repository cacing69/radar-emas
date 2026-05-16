import 'package:radar_emas/features/chart/data/datasources/chart_remote_datasource.dart';
import 'package:radar_emas/features/chart/data/mappers/gold_price_mapper.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/repositories/chart_repository.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartRemoteDatasource _datasource;
  final GoldPriceMapper _mapper;

  const ChartRepositoryImpl(this._datasource, this._mapper);

  @override
  Future<List<GoldPrice>> getPrices(String source) async {
    final response = await _datasource.getPrices(source);
    if (response.success && response.data != null) {
      return _mapper.toEntityList(response.data!);
    }
    throw Exception(response.message ?? 'Failed to fetch prices');
  }
}
