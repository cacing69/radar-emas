import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:radar_emas/features/chart/di/chart_di.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/usecases/get_chart_prices.dart';

part 'chart_provider.g.dart';

@riverpod
class SelectedSource extends _$SelectedSource {
  @override
  String build() => 'anekalogam';

  void select(String source) => state = source;
}

@riverpod
Future<List<GoldPrice>> chartPrices(Ref ref, String source) async {
  ref.keepAlive();
  final repository = ref.watch(chartRepositoryProvider);
  final usecase = GetChartPrices(repository);
  final result = await usecase(source);
  return result.fold(
    onSuccess: (data) => data,
    onFailure: (message) => throw Exception(message),
  );
}
