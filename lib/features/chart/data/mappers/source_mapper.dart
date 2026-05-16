import 'package:radar_emas/features/chart/data/dto/source_dto.dart';
import 'package:radar_emas/features/chart/domain/entities/source.dart';

class SourceMapper {
  const SourceMapper();

  Source toEntity(SourceDto dto) {
    return Source(
      name: dto.name,
      displayName: dto.displayName,
      logo: dto.logo,
      url: dto.url,
      urlHomepage: dto.urlHomepage,
    );
  }

  List<Source> toEntityList(List<SourceDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
