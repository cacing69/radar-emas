import 'package:freezed_annotation/freezed_annotation.dart';

part 'sources_response.freezed.dart';
part 'sources_response.g.dart';

@freezed
abstract class SourcesResponse with _$SourcesResponse {
  const factory SourcesResponse({
    @Default([]) List<dynamic> data,
  }) = _SourcesResponse;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);
}
