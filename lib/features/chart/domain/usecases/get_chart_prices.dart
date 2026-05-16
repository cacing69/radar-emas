import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/repositories/chart_repository.dart';

class GetChartPrices {
  final ChartRepository _repository;

  const GetChartPrices(this._repository);

  Future<Result<List<GoldPrice>>> call(String source) async {
    final result = await _repository.getPrices(source);
    return result.fold(
      onSuccess: (prices) {
        prices.sort((a, b) => a.weight.compareTo(b.weight));
        return Result.success(prices);
      },
      onFailure: (message) => Result.failure(message),
    );
  }
}
