// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoldPriceDto _$GoldPriceDtoFromJson(Map<String, dynamic> json) =>
    _GoldPriceDto(
      source: json['source'] as String? ?? '',
      material: json['material'] as String? ?? '',
      materialType: json['materialType'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      weightUnit: json['weightUnit'] as String? ?? 'gr',
      sellPrice: (json['sellPrice'] as num?)?.toDouble() ?? 0,
      buybackPrice: (json['buybackPrice'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'IDR',
      recordedDate: json['recordedDate'] as String? ?? '',
      lineKey: json['lineKey'] as String? ?? '',
      url: json['url'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      urlHomepage: json['urlHomepage'] as String? ?? '',
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
      'url': instance.url,
      'displayName': instance.displayName,
      'logo': instance.logo,
      'urlHomepage': instance.urlHomepage,
    };
