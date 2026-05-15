// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoldPriceDto _$GoldPriceDtoFromJson(Map<String, dynamic> json) =>
    _GoldPriceDto(
      source: json['source'] as String,
      material: json['material'] as String,
      materialType: json['materialType'] as String,
      weight: (json['weight'] as num).toDouble(),
      weightUnit: json['weightUnit'] as String,
      sellPrice: (json['sellPrice'] as num).toDouble(),
      buybackPrice: (json['buybackPrice'] as num).toDouble(),
      currency: json['currency'] as String,
      recordedDate: json['recordedDate'] as String,
      lineKey: json['lineKey'] as String,
    );

Map<String, dynamic> _$GoldPriceDtoToJson(_GoldPriceDto instance) =>
    <String, dynamic>{
      'source': instance.source,
      'material': instance.material,
      'materialType': instance.materialType,
      'weight': instance.weight,
      'weightUnit': instance.weightUnit,
      'sellPrice': instance.sellPrice,
      'buybackPrice': instance.buybackPrice,
      'currency': instance.currency,
      'recordedDate': instance.recordedDate,
      'lineKey': instance.lineKey,
    };
