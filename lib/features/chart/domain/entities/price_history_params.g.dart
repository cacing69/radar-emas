// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_history_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceHistoryParams _$PriceHistoryParamsFromJson(Map<String, dynamic> json) =>
    _PriceHistoryParams(
      source: json['source'] as String,
      length: (json['length'] as num?)?.toInt() ?? 7,
      weight: (json['weight'] as num?)?.toDouble(),
      material: json['material'] as String?,
      materialType: json['materialType'] as String?,
    );

Map<String, dynamic> _$PriceHistoryParamsToJson(_PriceHistoryParams instance) =>
    <String, dynamic>{
      'source': instance.source,
      'length': instance.length,
      'weight': instance.weight,
      'material': instance.material,
      'materialType': instance.materialType,
    };
