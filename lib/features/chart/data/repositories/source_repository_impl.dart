import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/data/mappers/source_mapper.dart';
import 'package:radar_emas/features/chart/domain/datasources/source_remote_datasource.dart';
import 'package:radar_emas/features/chart/domain/entities/source.dart';
import 'package:radar_emas/features/chart/domain/repositories/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  final SourceRemoteDatasource _datasource;
  final SourceMapper _mapper;

  const SourceRepositoryImpl(this._datasource, this._mapper);

  @override
  Future<Result<List<Source>>> getSources() async {
    try {
      final dtos = await _datasource.getSources();
      final entities = _mapper.toEntityList(dtos);
      return Result.success(entities);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }
}
