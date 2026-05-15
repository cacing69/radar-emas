import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:radar_emas/features/chart/data/repositories/chart_repository.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/usecases/get_chart_prices.dart';

part 'chart_provider.g.dart';

@riverpod
Future<List<GoldPrice>> chartPrices(Ref ref) async {
  final usecase = GetChartPrices(ChartRepository());
  return usecase();
}
