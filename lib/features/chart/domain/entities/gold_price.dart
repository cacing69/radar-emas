import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_price.freezed.dart';

@freezed
abstract class GoldPrice with _$GoldPrice {
  const factory GoldPrice({
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
  }) = _GoldPrice;
}
