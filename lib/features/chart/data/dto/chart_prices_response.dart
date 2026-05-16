import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_prices_response.freezed.dart';
part 'chart_prices_response.g.dart';

@freezed
abstract class ChartPricesResponse with _$ChartPricesResponse {
  const factory ChartPricesResponse({
    @Default(false) bool success,
    @Default([]) List<dynamic> data,
    @Default(0) int count,
    @Default('') String timestamp,
    @Default(false) bool cached,
  }) = _ChartPricesResponse;

  factory ChartPricesResponse.fromJson(Map<String, dynamic> json) =>
      _$ChartPricesResponseFromJson(json);
}
