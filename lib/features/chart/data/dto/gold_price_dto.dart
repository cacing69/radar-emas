import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_price_dto.freezed.dart';
part 'gold_price_dto.g.dart';

@freezed
abstract class GoldPriceDto with _$GoldPriceDto {
  const factory GoldPriceDto({
    required String source,
    required String material,
    required String materialType,
    required double weight,
    required String weightUnit,
    required double sellPrice,
    required double buybackPrice,
    required String currency,
    required String recordedDate,
    required String lineKey,
  }) = _GoldPriceDto;

  factory GoldPriceDto.fromJson(Map<String, dynamic> json) =>
      _$GoldPriceDtoFromJson(json);
}
