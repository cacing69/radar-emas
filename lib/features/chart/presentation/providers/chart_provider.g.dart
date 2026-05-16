// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedSource)
final selectedSourceProvider = SelectedSourceProvider._();

final class SelectedSourceProvider
    extends $NotifierProvider<SelectedSource, String> {
  SelectedSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSourceHash();

  @$internal
  @override
  SelectedSource create() => SelectedSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedSourceHash() => r'3761520da7784d974819dd74b99f53446b8e6574';

abstract class _$SelectedSource extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(sources)
final sourcesProvider = SourcesProvider._();

final class SourcesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Source>>,
          List<Source>,
          FutureOr<List<Source>>
        >
    with $FutureModifier<List<Source>>, $FutureProvider<List<Source>> {
  SourcesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sourcesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sourcesHash();

  @$internal
  @override
  $FutureProviderElement<List<Source>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Source>> create(Ref ref) {
    return sources(ref);
  }
}

String _$sourcesHash() => r'9ad0eadfb709dc06193e8179544e6d38c41202a2';

@ProviderFor(chartPrices)
final chartPricesProvider = ChartPricesFamily._();

final class ChartPricesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GoldPrice>>,
          List<GoldPrice>,
          FutureOr<List<GoldPrice>>
        >
    with $FutureModifier<List<GoldPrice>>, $FutureProvider<List<GoldPrice>> {
  ChartPricesProvider._({
    required ChartPricesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chartPricesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chartPricesHash();

  @override
  String toString() {
    return r'chartPricesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<GoldPrice>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GoldPrice>> create(Ref ref) {
    final argument = this.argument as String;
    return chartPrices(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ChartPricesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chartPricesHash() => r'f7de2e7f0d2a410268aa1ffbd8bae0f025c8ede4';

final class ChartPricesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<GoldPrice>>, String> {
  ChartPricesFamily._()
    : super(
        retry: null,
        name: r'chartPricesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChartPricesProvider call(String source) =>
      ChartPricesProvider._(argument: source, from: this);

  @override
  String toString() => r'chartPricesProvider';
}
