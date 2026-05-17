import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/entities/price_history_params.dart';
import 'package:radar_emas/features/chart/domain/repositories/chart_repository.dart';

class GetPriceHistories {
  final ChartRepository _repository;

  const GetPriceHistories(this._repository);

  Future<Result<List<GoldPrice>>> call(PriceHistoryParams params) async {
    final result = await _repository.getPriceHistories(params);
    return result.fold(
      onSuccess: (prices) {
        prices.sort((a, b) => a.recordedDate.compareTo(b.recordedDate));
        return Result.success(prices);
      },
      onFailure: (message) => Result.failure(message),
    );
  }
}
