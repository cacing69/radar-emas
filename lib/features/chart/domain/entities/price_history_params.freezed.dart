// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_history_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriceHistoryParams {

 String get source; int get length; double? get weight; String? get material; String? get materialType;
/// Create a copy of PriceHistoryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceHistoryParamsCopyWith<PriceHistoryParams> get copyWith => _$PriceHistoryParamsCopyWithImpl<PriceHistoryParams>(this as PriceHistoryParams, _$identity);

  /// Serializes this PriceHistoryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceHistoryParams&&(identical(other.source, source) || other.source == source)&&(identical(other.length, length) || other.length == length)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.material, material) || other.material == material)&&(identical(other.materialType, materialType) || other.materialType == materialType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,length,weight,material,materialType);

@override
String toString() {
  return 'PriceHistoryParams(source: $source, length: $length, weight: $weight, material: $material, materialType: $materialType)';
}


}

/// @nodoc
abstract mixin class $PriceHistoryParamsCopyWith<$Res>  {
  factory $PriceHistoryParamsCopyWith(PriceHistoryParams value, $Res Function(PriceHistoryParams) _then) = _$PriceHistoryParamsCopyWithImpl;
@useResult
$Res call({
 String source, int length, double? weight, String? material, String? materialType
});




}
/// @nodoc
class _$PriceHistoryParamsCopyWithImpl<$Res>
    implements $PriceHistoryParamsCopyWith<$Res> {
  _$PriceHistoryParamsCopyWithImpl(this._self, this._then);

  final PriceHistoryParams _self;
  final $Res Function(PriceHistoryParams) _then;

/// Create a copy of PriceHistoryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? length = null,Object? weight = freezed,Object? material = freezed,Object? materialType = freezed,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,materialType: freezed == materialType ? _self.materialType : materialType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceHistoryParams].
extension PriceHistoryParamsPatterns on PriceHistoryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceHistoryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceHistoryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceHistoryParams value)  $default,){
final _that = this;
switch (_that) {
case _PriceHistoryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceHistoryParams value)?  $default,){
final _that = this;
switch (_that) {
case _PriceHistoryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  int length,  double? weight,  String? material,  String? materialType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceHistoryParams() when $default != null:
return $default(_that.source,_that.length,_that.weight,_that.material,_that.materialType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  int length,  double? weight,  String? material,  String? materialType)  $default,) {final _that = this;
switch (_that) {
case _PriceHistoryParams():
return $default(_that.source,_that.length,_that.weight,_that.material,_that.materialType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  int length,  double? weight,  String? material,  String? materialType)?  $default,) {final _that = this;
switch (_that) {
case _PriceHistoryParams() when $default != null:
return $default(_that.source,_that.length,_that.weight,_that.material,_that.materialType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceHistoryParams implements PriceHistoryParams {
  const _PriceHistoryParams({required this.source, this.length = 7, this.weight, this.material, this.materialType});
  factory _PriceHistoryParams.fromJson(Map<String, dynamic> json) => _$PriceHistoryParamsFromJson(json);

@override final  String source;
@override@JsonKey() final  int length;
@override final  double? weight;
@override final  String? material;
@override final  String? materialType;

/// Create a copy of PriceHistoryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceHistoryParamsCopyWith<_PriceHistoryParams> get copyWith => __$PriceHistoryParamsCopyWithImpl<_PriceHistoryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceHistoryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceHistoryParams&&(identical(other.source, source) || other.source == source)&&(identical(other.length, length) || other.length == length)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.material, material) || other.material == material)&&(identical(other.materialType, materialType) || other.materialType == materialType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,length,weight,material,materialType);

@override
String toString() {
  return 'PriceHistoryParams(source: $source, length: $length, weight: $weight, material: $material, materialType: $materialType)';
}


}

/// @nodoc
abstract mixin class _$PriceHistoryParamsCopyWith<$Res> implements $PriceHistoryParamsCopyWith<$Res> {
  factory _$PriceHistoryParamsCopyWith(_PriceHistoryParams value, $Res Function(_PriceHistoryParams) _then) = __$PriceHistoryParamsCopyWithImpl;
@override @useResult
$Res call({
 String source, int length, double? weight, String? material, String? materialType
});




}
/// @nodoc
class __$PriceHistoryParamsCopyWithImpl<$Res>
    implements _$PriceHistoryParamsCopyWith<$Res> {
  __$PriceHistoryParamsCopyWithImpl(this._self, this._then);

  final _PriceHistoryParams _self;
  final $Res Function(_PriceHistoryParams) _then;

/// Create a copy of PriceHistoryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? length = null,Object? weight = freezed,Object? material = freezed,Object? materialType = freezed,}) {
  return _then(_PriceHistoryParams(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,materialType: freezed == materialType ? _self.materialType : materialType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
