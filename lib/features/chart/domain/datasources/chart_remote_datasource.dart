import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';
import 'package:radar_emas/features/chart/data/dto/source_dto.dart';

abstract class ChartRemoteDatasource {
  Future<List<SourceDto>> getSources();
  Future<List<GoldPriceDto>> getPrices(String source);
}
