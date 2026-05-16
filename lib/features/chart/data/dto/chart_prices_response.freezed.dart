// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_prices_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartPricesResponse {

 bool get success; List<dynamic> get data; int get count; String get timestamp; bool get cached;
/// Create a copy of ChartPricesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartPricesResponseCopyWith<ChartPricesResponse> get copyWith => _$ChartPricesResponseCopyWithImpl<ChartPricesResponse>(this as ChartPricesResponse, _$identity);

  /// Serializes this ChartPricesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartPricesResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.count, count) || other.count == count)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.cached, cached) || other.cached == cached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data),count,timestamp,cached);

@override
String toString() {
  return 'ChartPricesResponse(success: $success, data: $data, count: $count, timestamp: $timestamp, cached: $cached)';
}


}

/// @nodoc
abstract mixin class $ChartPricesResponseCopyWith<$Res>  {
  factory $ChartPricesResponseCopyWith(ChartPricesResponse value, $Res Function(ChartPricesResponse) _then) = _$ChartPricesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<dynamic> data, int count, String timestamp, bool cached
});




}
/// @nodoc
class _$ChartPricesResponseCopyWithImpl<$Res>
    implements $ChartPricesResponseCopyWith<$Res> {
  _$ChartPricesResponseCopyWithImpl(this._self, this._then);

  final ChartPricesResponse _self;
  final $Res Function(ChartPricesResponse) _then;

/// Create a copy of ChartPricesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,Object? count = null,Object? timestamp = null,Object? cached = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartPricesResponse].
extension ChartPricesResponsePatterns on ChartPricesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartPricesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartPricesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartPricesResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChartPricesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartPricesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChartPricesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<dynamic> data,  int count,  String timestamp,  bool cached)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartPricesResponse() when $default != null:
return $default(_that.success,_that.data,_that.count,_that.timestamp,_that.cached);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<dynamic> data,  int count,  String timestamp,  bool cached)  $default,) {final _that = this;
switch (_that) {
case _ChartPricesResponse():
return $default(_that.success,_that.data,_that.count,_that.timestamp,_that.cached);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<dynamic> data,  int count,  String timestamp,  bool cached)?  $default,) {final _that = this;
switch (_that) {
case _ChartPricesResponse() when $default != null:
return $default(_that.success,_that.data,_that.count,_that.timestamp,_that.cached);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartPricesResponse implements ChartPricesResponse {
  const _ChartPricesResponse({this.success = false, final  List<dynamic> data = const [], this.count = 0, this.timestamp = '', this.cached = false}): _data = data;
  factory _ChartPricesResponse.fromJson(Map<String, dynamic> json) => _$ChartPricesResponseFromJson(json);

@override@JsonKey() final  bool success;
 final  List<dynamic> _data;
@override@JsonKey() List<dynamic> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int count;
@override@JsonKey() final  String timestamp;
@override@JsonKey() final  bool cached;

/// Create a copy of ChartPricesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartPricesResponseCopyWith<_ChartPricesResponse> get copyWith => __$ChartPricesResponseCopyWithImpl<_ChartPricesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartPricesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartPricesResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.count, count) || other.count == count)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.cached, cached) || other.cached == cached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data),count,timestamp,cached);

@override
String toString() {
  return 'ChartPricesResponse(success: $success, data: $data, count: $count, timestamp: $timestamp, cached: $cached)';
}


}

/// @nodoc
abstract mixin class _$ChartPricesResponseCopyWith<$Res> implements $ChartPricesResponseCopyWith<$Res> {
  factory _$ChartPricesResponseCopyWith(_ChartPricesResponse value, $Res Function(_ChartPricesResponse) _then) = __$ChartPricesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<dynamic> data, int count, String timestamp, bool cached
});




}
/// @nodoc
class __$ChartPricesResponseCopyWithImpl<$Res>
    implements _$ChartPricesResponseCopyWith<$Res> {
  __$ChartPricesResponseCopyWithImpl(this._self, this._then);

  final _ChartPricesResponse _self;
  final $Res Function(_ChartPricesResponse) _then;

/// Create a copy of ChartPricesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,Object? count = null,Object? timestamp = null,Object? cached = null,}) {
  return _then(_ChartPricesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
