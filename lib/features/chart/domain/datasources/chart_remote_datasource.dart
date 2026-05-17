import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';
import 'package:radar_emas/features/chart/data/dto/source_dto.dart';
import 'package:radar_emas/features/chart/domain/entities/price_history_params.dart';

abstract class ChartRemoteDatasource {
  Future<List<SourceDto>> getSources();
  Future<List<GoldPriceDto>> getPrices(String source);
  Future<List<GoldPriceDto>> getPriceHistories(PriceHistoryParams params);
}
