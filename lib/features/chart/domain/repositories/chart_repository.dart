import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';

abstract class ChartRepository {
  Future<Result<List<GoldPrice>>> getPrices(String source);
}
