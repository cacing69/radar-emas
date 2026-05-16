// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logamMuliaApi)
final logamMuliaApiProvider = LogamMuliaApiProvider._();

final class LogamMuliaApiProvider
    extends $FunctionalProvider<LogamMuliaApi, LogamMuliaApi, LogamMuliaApi>
    with $Provider<LogamMuliaApi> {
  LogamMuliaApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logamMuliaApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logamMuliaApiHash();

  @$internal
  @override
  $ProviderElement<LogamMuliaApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogamMuliaApi create(Ref ref) {
    return logamMuliaApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogamMuliaApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogamMuliaApi>(value),
    );
  }
}

String _$logamMuliaApiHash() => r'f4e10d0cf2370bcb0c6cc00472596087accc2dac';

@ProviderFor(goldPriceMapper)
final goldPriceMapperProvider = GoldPriceMapperProvider._();

final class GoldPriceMapperProvider
    extends
        $FunctionalProvider<GoldPriceMapper, GoldPriceMapper, GoldPriceMapper>
    with $Provider<GoldPriceMapper> {
  GoldPriceMapperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goldPriceMapperProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goldPriceMapperHash();

  @$internal
  @override
  $ProviderElement<GoldPriceMapper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoldPriceMapper create(Ref ref) {
    return goldPriceMapper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoldPriceMapper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoldPriceMapper>(value),
    );
  }
}

String _$goldPriceMapperHash() => r'dbd9e4c166401b85724a0ddf75d7fceca88f63ad';

@ProviderFor(chartRemoteDatasource)
final chartRemoteDatasourceProvider = ChartRemoteDatasourceProvider._();

final class ChartRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          ChartRemoteDatasource,
          ChartRemoteDatasource,
          ChartRemoteDatasource
        >
    with $Provider<ChartRemoteDatasource> {
  ChartRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<ChartRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChartRemoteDatasource create(Ref ref) {
    return chartRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChartRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChartRemoteDatasource>(value),
    );
  }
}

String _$chartRemoteDatasourceHash() =>
    r'61c9eaccf507eb6aacf7c245c302157110e3fbee';

@ProviderFor(chartRepository)
final chartRepositoryProvider = ChartRepositoryProvider._();

final class ChartRepositoryProvider
    extends
        $FunctionalProvider<ChartRepository, ChartRepository, ChartRepository>
    with $Provider<ChartRepository> {
  ChartRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChartRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChartRepository create(Ref ref) {
    return chartRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChartRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChartRepository>(value),
    );
  }
}

String _$chartRepositoryHash() => r'3a6f9ee783ffe04abcac69fbe68098412ec44998';
