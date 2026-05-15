// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chartPrices)
final chartPricesProvider = ChartPricesProvider._();

final class ChartPricesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GoldPrice>>,
          List<GoldPrice>,
          FutureOr<List<GoldPrice>>
        >
    with $FutureModifier<List<GoldPrice>>, $FutureProvider<List<GoldPrice>> {
  ChartPricesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartPricesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartPricesHash();

  @$internal
  @override
  $FutureProviderElement<List<GoldPrice>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GoldPrice>> create(Ref ref) {
    return chartPrices(ref);
  }
}

String _$chartPricesHash() => r'39e957907236a968970ae62c17c1b29e5ba79c83';
