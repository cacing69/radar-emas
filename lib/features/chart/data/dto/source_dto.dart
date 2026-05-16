import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_dto.g.dart';
part 'source_dto.freezed.dart';

@freezed
abstract class SourceDto with _$SourceDto {
  const factory SourceDto({
    @Default('') String name,
    @Default('') String displayName,
    @Default('') String logo,
    @Default('') String url,
    @Default('') String urlHomepage,
  }) = _SourceDto;

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);
}
