import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:radar_emas/core/network/logam_mulia_api.dart';
import 'package:radar_emas/features/chart/data/datasources/chart_remote_datasource_impl.dart';
import 'package:radar_emas/features/chart/data/mappers/gold_price_mapper.dart';
import 'package:radar_emas/features/chart/data/repositories/chart_repository_impl.dart';
import 'package:radar_emas/features/chart/domain/datasources/chart_remote_datasource.dart';
import 'package:radar_emas/features/chart/domain/repositories/chart_repository.dart';

part 'chart_di.g.dart';

@riverpod
LogamMuliaApi logamMuliaApi(Ref ref) => LogamMuliaApi();

@riverpod
GoldPriceMapper goldPriceMapper(Ref ref) => const GoldPriceMapper();

@riverpod
ChartRemoteDatasource chartRemoteDatasource(Ref ref) =>
    ChartRemoteDatasourceImpl(ref.watch(logamMuliaApiProvider));

@riverpod
ChartRepository chartRepository(Ref ref) => ChartRepositoryImpl(
      ref.watch(chartRemoteDatasourceProvider),
      ref.watch(goldPriceMapperProvider),
    );
