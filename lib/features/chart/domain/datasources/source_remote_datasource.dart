import 'package:radar_emas/features/chart/data/dto/source_dto.dart';

abstract class SourceRemoteDatasource {
  Future<List<SourceDto>> getSources();
}
