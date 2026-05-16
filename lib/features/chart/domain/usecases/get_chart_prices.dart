import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/repositories/chart_repository.dart';

class GetChartPrices {
  final ChartRepository _repository;

  const GetChartPrices(this._repository);

  Future<List<GoldPrice>> call(String source) async {
    final prices = await _repository.getPrices(source);
    prices.sort((a, b) => a.weight.compareTo(b.weight));
    return prices;
  }
}
