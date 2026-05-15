// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoldPrice {

 String get source; String get material; String get materialType; double get weight; String get weightUnit; double get sellPrice; double get buybackPrice; String get currency; String get recordedDate; String get lineKey;
/// Create a copy of GoldPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoldPriceCopyWith<GoldPrice> get copyWith => _$GoldPriceCopyWithImpl<GoldPrice>(this as GoldPrice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoldPrice&&(identical(other.source, source) || other.source == source)&&(identical(other.material, material) || other.material == material)&&(identical(other.materialType, materialType) || other.materialType == materialType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.buybackPrice, buybackPrice) || other.buybackPrice == buybackPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.recordedDate, recordedDate) || other.recordedDate == recordedDate)&&(identical(other.lineKey, lineKey) || other.lineKey == lineKey));
}


@override
int get hashCode => Object.hash(runtimeType,source,material,materialType,weight,weightUnit,sellPrice,buybackPrice,currency,recordedDate,lineKey);

@override
String toString() {
  return 'GoldPrice(source: $source, material: $material, materialType: $materialType, weight: $weight, weightUnit: $weightUnit, sellPrice: $sellPrice, buybackPrice: $buybackPrice, currency: $currency, recordedDate: $recordedDate, lineKey: $lineKey)';
}


}

/// @nodoc
abstract mixin class $GoldPriceCopyWith<$Res>  {
  factory $GoldPriceCopyWith(GoldPrice value, $Res Function(GoldPrice) _then) = _$GoldPriceCopyWithImpl;
@useResult
$Res call({
 String source, String material, String materialType, double weight, String weightUnit, double sellPrice, double buybackPrice, String currency, String recordedDate, String lineKey
});




}
/// @nodoc
class _$GoldPriceCopyWithImpl<$Res>
    implements $GoldPriceCopyWith<$Res> {
  _$GoldPriceCopyWithImpl(this._self, this._then);

  final GoldPrice _self;
  final $Res Function(GoldPrice) _then;

/// Create a copy of GoldPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? material = null,Object? materialType = null,Object? weight = null,Object? weightUnit = null,Object? sellPrice = null,Object? buybackPrice = null,Object? currency = null,Object? recordedDate = null,Object? lineKey = null,}) {
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
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoldPrice].
extension GoldPricePatterns on GoldPrice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoldPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoldPrice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoldPrice value)  $default,){
final _that = this;
switch (_that) {
case _GoldPrice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoldPrice value)?  $default,){
final _that = this;
switch (_that) {
case _GoldPrice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String material,  String materialType,  double weight,  String weightUnit,  double sellPrice,  double buybackPrice,  String currency,  String recordedDate,  String lineKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoldPrice() when $default != null:
return $default(_that.source,_that.material,_that.materialType,_that.weight,_that.weightUnit,_that.sellPrice,_that.buybackPrice,_that.currency,_that.recordedDate,_that.lineKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String material,  String materialType,  double weight,  String weightUnit,  double sellPrice,  double buybackPrice,  String currency,  String recordedDate,  String lineKey)  $default,) {final _that = this;
switch (_that) {
case _GoldPrice():
return $default(_that.source,_that.material,_that.materialType,_that.weight,_that.weightUnit,_that.sellPrice,_that.buybackPrice,_that.currency,_that.recordedDate,_that.lineKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String material,  String materialType,  double weight,  String weightUnit,  double sellPrice,  double buybackPrice,  String currency,  String recordedDate,  String lineKey)?  $default,) {final _that = this;
switch (_that) {
case _GoldPrice() when $default != null:
return $default(_that.source,_that.material,_that.materialType,_that.weight,_that.weightUnit,_that.sellPrice,_that.buybackPrice,_that.currency,_that.recordedDate,_that.lineKey);case _:
  return null;

}
}

}

/// @nodoc


class _GoldPrice implements GoldPrice {
  const _GoldPrice({required this.source, required this.material, required this.materialType, required this.weight, required this.weightUnit, required this.sellPrice, required this.buybackPrice, required this.currency, required this.recordedDate, required this.lineKey});
  

@override final  String source;
@override final  String material;
@override final  String materialType;
@override final  double weight;
@override final  String weightUnit;
@override final  double sellPrice;
@override final  double buybackPrice;
@override final  String currency;
@override final  String recordedDate;
@override final  String lineKey;

/// Create a copy of GoldPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoldPriceCopyWith<_GoldPrice> get copyWith => __$GoldPriceCopyWithImpl<_GoldPrice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoldPrice&&(identical(other.source, source) || other.source == source)&&(identical(other.material, material) || other.material == material)&&(identical(other.materialType, materialType) || other.materialType == materialType)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.sellPrice, sellPrice) || other.sellPrice == sellPrice)&&(identical(other.buybackPrice, buybackPrice) || other.buybackPrice == buybackPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.recordedDate, recordedDate) || other.recordedDate == recordedDate)&&(identical(other.lineKey, lineKey) || other.lineKey == lineKey));
}


@override
int get hashCode => Object.hash(runtimeType,source,material,materialType,weight,weightUnit,sellPrice,buybackPrice,currency,recordedDate,lineKey);

@override
String toString() {
  return 'GoldPrice(source: $source, material: $material, materialType: $materialType, weight: $weight, weightUnit: $weightUnit, sellPrice: $sellPrice, buybackPrice: $buybackPrice, currency: $currency, recordedDate: $recordedDate, lineKey: $lineKey)';
}


}

/// @nodoc
abstract mixin class _$GoldPriceCopyWith<$Res> implements $GoldPriceCopyWith<$Res> {
  factory _$GoldPriceCopyWith(_GoldPrice value, $Res Function(_GoldPrice) _then) = __$GoldPriceCopyWithImpl;
@override @useResult
$Res call({
 String source, String material, String materialType, double weight, String weightUnit, double sellPrice, double buybackPrice, String currency, String recordedDate, String lineKey
});




}
/// @nodoc
class __$GoldPriceCopyWithImpl<$Res>
    implements _$GoldPriceCopyWith<$Res> {
  __$GoldPriceCopyWithImpl(this._self, this._then);

  final _GoldPrice _self;
  final $Res Function(_GoldPrice) _then;

/// Create a copy of GoldPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? material = null,Object? materialType = null,Object? weight = null,Object? weightUnit = null,Object? sellPrice = null,Object? buybackPrice = null,Object? currency = null,Object? recordedDate = null,Object? lineKey = null,}) {
  return _then(_GoldPrice(
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
as String,
  ));
}


}

// dart format on
