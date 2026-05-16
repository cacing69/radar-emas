import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_price_dto.freezed.dart';
part 'gold_price_dto.g.dart';

@freezed
abstract class GoldPriceDto with _$GoldPriceDto {
  const factory GoldPriceDto({
    @Default('') String source,
    @Default('') String material,
    @Default('') String materialType,
    @Default(0) double weight,
    @Default('gr') String weightUnit,
    @Default(0) double sellPrice,
    @Default(0) double buybackPrice,
    @Default('IDR') String currency,
    @Default('') String recordedDate,
    @Default('') String lineKey,
    @Default('') String url,
    @Default('') String displayName,
    @Default('') String logo,
    @Default('') String urlHomepage,
  }) = _GoldPriceDto;

  factory GoldPriceDto.fromJson(Map<String, dynamic> json) =>
      _$GoldPriceDtoFromJson(json);
}
