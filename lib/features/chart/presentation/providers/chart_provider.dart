import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:radar_emas/features/chart/di/chart_di.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';
import 'package:radar_emas/features/chart/domain/entities/price_history_params.dart';
import 'package:radar_emas/features/chart/domain/entities/source.dart';
import 'package:radar_emas/features/chart/domain/usecases/get_chart_prices.dart';
import 'package:radar_emas/features/chart/domain/usecases/get_price_histories.dart';
import 'package:radar_emas/features/chart/domain/usecases/get_sources.dart';

part 'chart_provider.g.dart';

@riverpod
class SelectedSource extends _$SelectedSource {
  @override
  String build() => 'anekalogam';

  void select(String source) => state = source;
}

@riverpod
class SelectedChartPrice extends _$SelectedChartPrice {
  @override
  GoldPrice? build() {
    ref.keepAlive();
    return null;
  }

  void select(GoldPrice price) => state = price;
  void clear() => state = null;
}

@riverpod
Future<List<Source>> sources(Ref ref) async {
  ref.keepAlive();
  final repository = ref.watch(sourceRepositoryProvider);
  final result = await GetSources(repository).call();
  return result.fold(
    onFailure: (message) => throw Exception(message),
    onSuccess: (data) => data,
  );
}

@riverpod
Future<List<GoldPrice>> chartPrices(Ref ref, String source) async {
  ref.keepAlive();
  final repository = ref.watch(chartRepositoryProvider);
  final usecase = GetChartPrices(repository);
  final result = await usecase(source);
  return result.fold(
    onFailure: (message) => throw Exception(message),
    onSuccess: (data) => data,
  );
}

@riverpod
Future<List<GoldPrice>> priceHistory(Ref ref, GoldPrice price) async {
  ref.keepAlive();
  final repository = ref.watch(chartRepositoryProvider);
  final usecase = GetPriceHistories(repository);
  final params = PriceHistoryParams(
    source: price.source,
    weight: price.weight,
    material: price.material,
    materialType: price.materialType,
  );
  final result = await usecase(params);
  return result.fold(
    onFailure: (message) => throw Exception(message),
    onSuccess: (data) => data,
  );
}
