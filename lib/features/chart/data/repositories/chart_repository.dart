import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/features/chart/data/datasources/chart_datasource.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/mappers/gold_price_mapper.dart';

class ChartRepository {
  final ChartDatasource _datasource;
  final GoldPriceMapper _mapper;

  ChartRepository()
      : _datasource = ChartDatasource(LogamMuliaApi()),
        _mapper = GoldPriceMapper();

  Future<List<GoldPrice>> getPrices() async {
    final response = await _datasource.getPrices();
    if (response.success && response.data != null) {
      final entities = _mapper.toEntityList(response.data!);
      entities.sort((a, b) => a.weight.compareTo(b.weight));
      return entities;
    }
    throw Exception(response.message ?? 'Gagal mengambil data harga');
  }
}
