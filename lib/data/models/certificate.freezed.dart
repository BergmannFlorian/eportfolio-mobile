// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiCertificate {

 String get title; DateTime get date; String? get url;
/// Create a copy of ApiCertificate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiCertificateCopyWith<ApiCertificate> get copyWith => _$ApiCertificateCopyWithImpl<ApiCertificate>(this as ApiCertificate, _$identity);

  /// Serializes this ApiCertificate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiCertificate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiCertificate&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiCertificate;
  return Object.hash(runtimeType,_this.title,_this.date,_this.url);
}

@override
String toString() {
  final _this = this as ApiCertificate;
  return 'ApiCertificate(title: ${_this.title}, date: ${_this.date}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $ApiCertificateCopyWith<$Res>  {
  factory $ApiCertificateCopyWith(ApiCertificate value, $Res Function(ApiCertificate) _then) = _$ApiCertificateCopyWithImpl;
@useResult
$Res call({
 String title, DateTime date, String? url
});




}
/// @nodoc
class _$ApiCertificateCopyWithImpl<$Res>
    implements $ApiCertificateCopyWith<$Res> {
  _$ApiCertificateCopyWithImpl(this._self, this._then);

  final ApiCertificate _self;
  final $Res Function(ApiCertificate) _then;

/// Create a copy of ApiCertificate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? date = null,Object? url = freezed,}) {
  return _then(ApiCertificate(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiCertificate].
extension ApiCertificatePatterns on ApiCertificate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiCertificate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiCertificate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiCertificate value)  $default,){
final _that = this;
switch (_that) {
case _ApiCertificate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiCertificate value)?  $default,){
final _that = this;
switch (_that) {
case _ApiCertificate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  DateTime date,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiCertificate() when $default != null:
return $default(_that.title,_that.date,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  DateTime date,  String? url)  $default,) {final _that = this;
switch (_that) {
case _ApiCertificate():
return $default(_that.title,_that.date,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  DateTime date,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _ApiCertificate() when $default != null:
return $default(_that.title,_that.date,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiCertificate implements ApiCertificate {
  const _ApiCertificate({required this.title, required this.date, this.url});
  factory _ApiCertificate.fromJson(Map<String, dynamic> json) => _$ApiCertificateFromJson(json);

@override final  String title;
@override final  DateTime date;
@override final  String? url;

/// Create a copy of ApiCertificate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiCertificateCopyWith<_ApiCertificate> get copyWith => __$ApiCertificateCopyWithImpl<_ApiCertificate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiCertificateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiCertificate&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,date,url);
}

@override
String toString() {
    return 'ApiCertificate(title: $title, date: $date, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ApiCertificateCopyWith<$Res> implements $ApiCertificateCopyWith<$Res> {
  factory _$ApiCertificateCopyWith(_ApiCertificate value, $Res Function(_ApiCertificate) _then) = __$ApiCertificateCopyWithImpl;
@override @useResult
$Res call({
 String title, DateTime date, String? url
});




}
/// @nodoc
class __$ApiCertificateCopyWithImpl<$Res>
    implements _$ApiCertificateCopyWith<$Res> {
  __$ApiCertificateCopyWithImpl(this._self, this._then);

  final _ApiCertificate _self;
  final $Res Function(_ApiCertificate) _then;

/// Create a copy of ApiCertificate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? date = null,Object? url = freezed,}) {
  return _then(_ApiCertificate(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
