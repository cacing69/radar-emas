import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_history_params.freezed.dart';
part 'price_history_params.g.dart';

@freezed
abstract class PriceHistoryParams with _$PriceHistoryParams {
  const factory PriceHistoryParams({
    required String source,
    @Default(7) int length,
    double? weight,
    String? material,
    String? materialType,
  }) = _PriceHistoryParams;

  factory PriceHistoryParams.fromJson(Map<String, dynamic> json) =>
      _$PriceHistoryParamsFromJson(json);
}
