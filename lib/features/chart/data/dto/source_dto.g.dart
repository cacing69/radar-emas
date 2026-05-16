// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) => _SourceDto(
  name: json['name'] as String? ?? '',
  displayName: json['displayName'] as String? ?? '',
  logo: json['logo'] as String? ?? '',
  url: json['url'] as String? ?? '',
  urlHomepage: json['urlHomepage'] as String? ?? '',
);

Map<String, dynamic> _$SourceDtoToJson(_SourceDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'logo': instance.logo,
      'url': instance.url,
      'urlHomepage': instance.urlHomepage,
    };
