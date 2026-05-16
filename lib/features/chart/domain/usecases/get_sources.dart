import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/domain/entities/source.dart';
import 'package:radar_emas/features/chart/domain/repositories/source_repository.dart';

class GetSources {
  final SourceRepository _repository;

  const GetSources(this._repository);

  Future<Result<List<Source>>> call() {
    return _repository.getSources();
  }
}
