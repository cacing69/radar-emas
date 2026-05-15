import 'package:radar_emas/features/chart/data/repositories/chart_repository.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';

class GetChartPrices {
  final ChartRepository _repository;

  GetChartPrices(this._repository);

  Future<List<GoldPrice>> call() async {
    return _repository.getPrices();
  }
}
