import 'package:radar_emas/core/result/result.dart';
import 'package:radar_emas/features/chart/domain/entities/source.dart';

abstract class SourceRepository {
  Future<Result<List<Source>>> getSources();
}
