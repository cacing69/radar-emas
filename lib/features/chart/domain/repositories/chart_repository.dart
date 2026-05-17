import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/entities/price_history_params.dart';

abstract class ChartRepository {
  Future<Result<List<GoldPrice>>> getPrices(String source);
  Future<Result<List<GoldPrice>>> getPriceHistories(PriceHistoryParams params);
}
