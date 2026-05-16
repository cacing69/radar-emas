// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoldPriceDto {

 String get source; String get material; String get materialType; double get weight; String get weightUnit; double get sellPrice; double get buybackPrice; String get currency; String get recordedDate; String get lineKey; String get url; String get displayName; String get logo; String get urlHomepage;
/// Create a copy of GoldPriceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoldPriceDtoCopyWith<GoldPriceDto> get copyWith => _$GoldPriceDtoCopyWithImpl<GoldPriceDto>(this as GoldPriceDto, _$identity);

  /// Serializes this GoldPriceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoldPriceDto&&(identical(other.source, source) || other.source == source)&&(identical(other.material, material) || other.material == material)&&(identical(other.materialType, materialType) || other.materialType == materialType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.buybackPrice, buybackPrice) || other.buybackPrice == buybackPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.recordedDate, recordedDate) || other.recordedDate == recordedDate)&&(identical(other.lineKey, lineKey) || other.lineKey == lineKey)&&(identical(other.url, url) || other.url == url)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.urlHomepage, urlHomepage) || other.urlHomepage == urlHomepage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,material,materialType,weight,weightUnit,sellPrice,buybackPrice,currency,recordedDate,lineKey,url,displayName,logo,urlHomepage);

@override
String toString() {
  return 'GoldPriceDto(source: $source, material: $material, materialType: $materialType, weight: $weight, weightUnit: $weightUnit, sellPrice: $sellPrice, buybackPrice: $buybackPrice, currency: $currency, recordedDate: $recordedDate, lineKey: $lineKey, url: $url, displayName: $displayName, logo: $logo, urlHomepage: $urlHomepage)';
}


}

/// @nodoc
abstract mixin class $GoldPriceDtoCopyWith<$Res>  {
  factory $GoldPriceDtoCopyWith(GoldPriceDto value, $Res Function(GoldPriceDto) _then) = _$GoldPriceDtoCopyWithImpl;
@useResult
$Res call({
 String source, String material, String materialType, double weight, String weightUnit, double sellPrice, double buybackPrice, String currency, String recordedDate, String lineKey, String url, String displayName, String logo, String urlHomepage
});




}
/// @nodoc
class _$GoldPriceDtoCopyWithImpl<$Res>
    implements $GoldPriceDtoCopyWith<$Res> {
  _$GoldPriceDtoCopyWithImpl(this._self, this._then);

  final GoldPriceDto _self;
  final $Res Function(GoldPriceDto) _then;

/// Create a copy of GoldPriceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? material = null,Object? materialType = null,Object? weight = null,Object? weightUnit = null,Object? sellPrice = null,Object? buybackPrice = null,Object? currency = null,Object? recordedDate = null,Object? lineKey = null,Object? url = null,Object? displayName = null,Object? logo = null,Object? urlHomepage = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,materialType: null == materialType ? _self.materialType : materialType // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as String,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as double,buybackPrice: null == buybackPrice ? _self.buybackPrice : buybackPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,recordedDate: null == recordedDate ? _self.recordedDate : recordedDate // ignore: cast_nullable_to_non_nullable
as String,lineKey: null == lineKey ? _self.lineKey : lineKey // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,urlHomepage: null == urlHomepage ? _self.urlHomepage : urlHomepage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoldPriceDto].
extension GoldPriceDtoPatterns on GoldPriceDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoldPriceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoldPriceDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoldPriceDto value)  $default,){
final _that = this;
switch (_that) {
case _GoldPriceDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoldPriceDto value)?  $default,){
final _that = this;
switch (_that) {
case _GoldPriceDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String material,  String materialType,  double weight,  String weightUnit,  double sellPrice,  double buybackPrice,  String currency,  String recordedDate,  String lineKey,  String url,  String displayName,  String logo,  String urlHomepage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoldPriceDto() when $default != null:
return $default(_that.source,_that.material,_that.materialType,_that.weight,_that.weightUnit,_that.sellPrice,_that.buybackPrice,_that.currency,_that.recordedDate,_that.lineKey,_that.url,_that.displayName,_that.logo,_that.urlHomepage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String material,  String materialType,  double weight,  String weightUnit,  double sellPrice,  double buybackPrice,  String currency,  String recordedDate,  String lineKey,  String url,  String displayName,  String logo,  String urlHomepage)  $default,) {final _that = this;
switch (_that) {
case _GoldPriceDto():
return $default(_that.source,_that.material,_that.materialType,_that.weight,_that.weightUnit,_that.sellPrice,_that.buybackPrice,_that.currency,_that.recordedDate,_that.lineKey,_that.url,_that.displayName,_that.logo,_that.urlHomepage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String material,  String materialType,  double weight,  String weightUnit,  double sellPrice,  double buybackPrice,  String currency,  String recordedDate,  String lineKey,  String url,  String displayName,  String logo,  String urlHomepage)?  $default,) {final _that = this;
switch (_that) {
case _GoldPriceDto() when $default != null:
return $default(_that.source,_that.material,_that.materialType,_that.weight,_that.weightUnit,_that.sellPrice,_that.buybackPrice,_that.currency,_that.recordedDate,_that.lineKey,_that.url,_that.displayName,_that.logo,_that.urlHomepage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoldPriceDto implements GoldPriceDto {
  const _GoldPriceDto({this.source = '', this.material = '', this.materialType = '', this.weight = 0, this.weightUnit = 'gr', this.sellPrice = 0, this.buybackPrice = 0, this.currency = 'IDR', this.recordedDate = '', this.lineKey = '', this.url = '', this.displayName = '', this.logo = '', this.urlHomepage = ''});
  factory _GoldPriceDto.fromJson(Map<String, dynamic> json) => _$GoldPriceDtoFromJson(json);

@override@JsonKey() final  String source;
@override@JsonKey() final  String material;
@override@JsonKey() final  String materialType;
@override@JsonKey() final  double weight;
@override@JsonKey() final  String weightUnit;
@override@JsonKey() final  double sellPrice;
@override@JsonKey() final  double buybackPrice;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String recordedDate;
@override@JsonKey() final  String lineKey;
@override@JsonKey() final  String url;
@override@JsonKey() final  String displayName;
@override@JsonKey() final  String logo;
@override@JsonKey() final  String urlHomepage;

/// Create a copy of GoldPriceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoldPriceDtoCopyWith<_GoldPriceDto> get copyWith => __$GoldPriceDtoCopyWithImpl<_GoldPriceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoldPriceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoldPriceDto&&(identical(other.source, source) || other.source == source)&&(identical(other.material, material) || other.material == material)&&(identical(other.materialType, materialType) || other.materialType == materialType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.buybackPrice, buybackPrice) || other.buybackPrice == buybackPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.recordedDate, recordedDate) || other.recordedDate == recordedDate)&&(identical(other.lineKey, lineKey) || other.lineKey == lineKey)&&(identical(other.url, url) || other.url == url)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.urlHomepage, urlHomepage) || other.urlHomepage == urlHomepage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,material,materialType,weight,weightUnit,sellPrice,buybackPrice,currency,recordedDate,lineKey,url,displayName,logo,urlHomepage);

@override
String toString() {
  return 'GoldPriceDto(source: $source, material: $material, materialType: $materialType, weight: $weight, weightUnit: $weightUnit, sellPrice: $sellPrice, buybackPrice: $buybackPrice, currency: $currency, recordedDate: $recordedDate, lineKey: $lineKey, url: $url, displayName: $displayName, logo: $logo, urlHomepage: $urlHomepage)';
}


}

/// @nodoc
abstract mixin class _$GoldPriceDtoCopyWith<$Res> implements $GoldPriceDtoCopyWith<$Res> {
  factory _$GoldPriceDtoCopyWith(_GoldPriceDto value, $Res Function(_GoldPriceDto) _then) = __$GoldPriceDtoCopyWithImpl;
@override @useResult
$Res call({
 String source, String material, String materialType, double weight, String weightUnit, double sellPrice, double buybackPrice, String currency, String recordedDate, String lineKey, String url, String displayName, String logo, String urlHomepage
});




}
/// @nodoc
class __$GoldPriceDtoCopyWithImpl<$Res>
    implements _$GoldPriceDtoCopyWith<$Res> {
  __$GoldPriceDtoCopyWithImpl(this._self, this._then);

  final _GoldPriceDto _self;
  final $Res Function(_GoldPriceDto) _then;

/// Create a copy of GoldPriceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? material = null,Object? materialType = null,Object? weight = null,Object? weightUnit = null,Object? sellPrice = null,Object? buybackPrice = null,Object? currency = null,Object? recordedDate = null,Object? lineKey = null,Object? url = null,Object? displayName = null,Object? logo = null,Object? urlHomepage = null,}) {
  return _then(_GoldPriceDto(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,materialType: null == materialType ? _self.materialType : materialType // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as String,sellPrice: null == sellPrice ? _self.sellPrice : sellPrice // ignore: cast_nullable_to_non_nullable
as double,buybackPrice: null == buybackPrice ? _self.buybackPrice : buybackPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,recordedDate: null == recordedDate ? _self.recordedDate : recordedDate // ignore: cast_nullable_to_non_nullable
as String,lineKey: null == lineKey ? _self.lineKey : lineKey // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,urlHomepage: null == urlHomepage ? _self.urlHomepage : urlHomepage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
