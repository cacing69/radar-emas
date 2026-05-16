// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sources_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourcesResponse {

 List<dynamic> get data;
/// Create a copy of SourcesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourcesResponseCopyWith<SourcesResponse> get copyWith => _$SourcesResponseCopyWithImpl<SourcesResponse>(this as SourcesResponse, _$identity);

  /// Serializes this SourcesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourcesResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SourcesResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $SourcesResponseCopyWith<$Res>  {
  factory $SourcesResponseCopyWith(SourcesResponse value, $Res Function(SourcesResponse) _then) = _$SourcesResponseCopyWithImpl;
@useResult
$Res call({
 List<dynamic> data
});




}
/// @nodoc
class _$SourcesResponseCopyWithImpl<$Res>
    implements $SourcesResponseCopyWith<$Res> {
  _$SourcesResponseCopyWithImpl(this._self, this._then);

  final SourcesResponse _self;
  final $Res Function(SourcesResponse) _then;

/// Create a copy of SourcesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SourcesResponse].
extension SourcesResponsePatterns on SourcesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourcesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourcesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourcesResponse value)  $default,){
final _that = this;
switch (_that) {
case _SourcesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourcesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SourcesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<dynamic> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourcesResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<dynamic> data)  $default,) {final _that = this;
switch (_that) {
case _SourcesResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<dynamic> data)?  $default,) {final _that = this;
switch (_that) {
case _SourcesResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourcesResponse implements SourcesResponse {
  const _SourcesResponse({final  List<dynamic> data = const []}): _data = data;
  factory _SourcesResponse.fromJson(Map<String, dynamic> json) => _$SourcesResponseFromJson(json);

 final  List<dynamic> _data;
@override@JsonKey() List<dynamic> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SourcesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourcesResponseCopyWith<_SourcesResponse> get copyWith => __$SourcesResponseCopyWithImpl<_SourcesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourcesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourcesResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SourcesResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SourcesResponseCopyWith<$Res> implements $SourcesResponseCopyWith<$Res> {
  factory _$SourcesResponseCopyWith(_SourcesResponse value, $Res Function(_SourcesResponse) _then) = __$SourcesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<dynamic> data
});




}
/// @nodoc
class __$SourcesResponseCopyWithImpl<$Res>
    implements _$SourcesResponseCopyWith<$Res> {
  __$SourcesResponseCopyWithImpl(this._self, this._then);

  final _SourcesResponse _self;
  final $Res Function(_SourcesResponse) _then;

/// Create a copy of SourcesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_SourcesResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
