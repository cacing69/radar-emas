import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';

abstract class ChartRepository {
  Future<List<GoldPrice>> getPrices(String source);
}
