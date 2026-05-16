// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_prices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartPricesResponse _$ChartPricesResponseFromJson(Map<String, dynamic> json) =>
    _ChartPricesResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] as List<dynamic>? ?? const [],
      count: (json['count'] as num?)?.toInt() ?? 0,
      timestamp: json['timestamp'] as String? ?? '',
      cached: json['cached'] as bool? ?? false,
    );

Map<String, dynamic> _$ChartPricesResponseToJson(
  _ChartPricesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'count': instance.count,
  'timestamp': instance.timestamp,
  'cached': instance.cached,
};
