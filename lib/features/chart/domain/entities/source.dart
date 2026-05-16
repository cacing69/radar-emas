import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';

@freezed
abstract class Source with _$Source {
  const factory Source({
    @Default('') String name,
    @Default('') String displayName,
    @Default('') String logo,
    @Default('') String url,
    @Default('') String urlHomepage,
  }) = _Source;
}
