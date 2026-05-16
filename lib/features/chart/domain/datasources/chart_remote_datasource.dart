import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';

abstract class ChartRemoteDatasource {
  Future<List<GoldPriceDto>> getPrices(String source);
}
