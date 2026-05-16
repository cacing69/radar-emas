// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourceDto {

 String get name; String get displayName; String get logo; String get url; String get urlHomepage;
/// Create a copy of SourceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceDtoCopyWith<SourceDto> get copyWith => _$SourceDtoCopyWithImpl<SourceDto>(this as SourceDto, _$identity);

  /// Serializes this SourceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceDto&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlHomepage, urlHomepage) || other.urlHomepage == urlHomepage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,displayName,logo,url,urlHomepage);

@override
String toString() {
  return 'SourceDto(name: $name, displayName: $displayName, logo: $logo, url: $url, urlHomepage: $urlHomepage)';
}


}

/// @nodoc
abstract mixin class $SourceDtoCopyWith<$Res>  {
  factory $SourceDtoCopyWith(SourceDto value, $Res Function(SourceDto) _then) = _$SourceDtoCopyWithImpl;
@useResult
$Res call({
 String name, String displayName, String logo, String url, String urlHomepage
});




}
/// @nodoc
class _$SourceDtoCopyWithImpl<$Res>
    implements $SourceDtoCopyWith<$Res> {
  _$SourceDtoCopyWithImpl(this._self, this._then);

  final SourceDto _self;
  final $Res Function(SourceDto) _then;

/// Create a copy of SourceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? displayName = null,Object? logo = null,Object? url = null,Object? urlHomepage = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlHomepage: null == urlHomepage ? _self.urlHomepage : urlHomepage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceDto].
extension SourceDtoPatterns on SourceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceDto value)  $default,){
final _that = this;
switch (_that) {
case _SourceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceDto value)?  $default,){
final _that = this;
switch (_that) {
case _SourceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String displayName,  String logo,  String url,  String urlHomepage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceDto() when $default != null:
return $default(_that.name,_that.displayName,_that.logo,_that.url,_that.urlHomepage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String displayName,  String logo,  String url,  String urlHomepage)  $default,) {final _that = this;
switch (_that) {
case _SourceDto():
return $default(_that.name,_that.displayName,_that.logo,_that.url,_that.urlHomepage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String displayName,  String logo,  String url,  String urlHomepage)?  $default,) {final _that = this;
switch (_that) {
case _SourceDto() when $default != null:
return $default(_that.name,_that.displayName,_that.logo,_that.url,_that.urlHomepage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceDto implements SourceDto {
  const _SourceDto({this.name = '', this.displayName = '', this.logo = '', this.url = '', this.urlHomepage = ''});
  factory _SourceDto.fromJson(Map<String, dynamic> json) => _$SourceDtoFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String displayName;
@override@JsonKey() final  String logo;
@override@JsonKey() final  String url;
@override@JsonKey() final  String urlHomepage;

/// Create a copy of SourceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceDtoCopyWith<_SourceDto> get copyWith => __$SourceDtoCopyWithImpl<_SourceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceDto&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlHomepage, urlHomepage) || other.urlHomepage == urlHomepage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,displayName,logo,url,urlHomepage);

@override
String toString() {
  return 'SourceDto(name: $name, displayName: $displayName, logo: $logo, url: $url, urlHomepage: $urlHomepage)';
}


}

/// @nodoc
abstract mixin class _$SourceDtoCopyWith<$Res> implements $SourceDtoCopyWith<$Res> {
  factory _$SourceDtoCopyWith(_SourceDto value, $Res Function(_SourceDto) _then) = __$SourceDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String displayName, String logo, String url, String urlHomepage
});




}
/// @nodoc
class __$SourceDtoCopyWithImpl<$Res>
    implements _$SourceDtoCopyWith<$Res> {
  __$SourceDtoCopyWithImpl(this._self, this._then);

  final _SourceDto _self;
  final $Res Function(_SourceDto) _then;

/// Create a copy of SourceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? displayName = null,Object? logo = null,Object? url = null,Object? urlHomepage = null,}) {
  return _then(_SourceDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlHomepage: null == urlHomepage ? _self.urlHomepage : urlHomepage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
