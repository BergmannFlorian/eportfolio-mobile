// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiSkills {

/// Short "main stack" list.
 List<String> get stack; List<SkillCategory> get categories;
/// Create a copy of ApiSkills
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiSkillsCopyWith<ApiSkills> get copyWith => _$ApiSkillsCopyWithImpl<ApiSkills>(this as ApiSkills, _$identity);

  /// Serializes this ApiSkills to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiSkills;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiSkills&&const DeepCollectionEquality().equals(other.stack, _this.stack)&&const DeepCollectionEquality().equals(other.categories, _this.categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiSkills;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.stack),const DeepCollectionEquality().hash(_this.categories));
}

@override
String toString() {
  final _this = this as ApiSkills;
  return 'ApiSkills(stack: ${_this.stack}, categories: ${_this.categories})';
}


}

/// @nodoc
abstract mixin class $ApiSkillsCopyWith<$Res>  {
  factory $ApiSkillsCopyWith(ApiSkills value, $Res Function(ApiSkills) _then) = _$ApiSkillsCopyWithImpl;
@useResult
$Res call({
 List<String> stack, List<SkillCategory> categories
});




}
/// @nodoc
class _$ApiSkillsCopyWithImpl<$Res>
    implements $ApiSkillsCopyWith<$Res> {
  _$ApiSkillsCopyWithImpl(this._self, this._then);

  final ApiSkills _self;
  final $Res Function(ApiSkills) _then;

/// Create a copy of ApiSkills
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stack = null,Object? categories = null,}) {
  return _then(ApiSkills(
stack: null == stack ? _self.stack : stack // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<SkillCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiSkills].
extension ApiSkillsPatterns on ApiSkills {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiSkills value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiSkills() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiSkills value)  $default,){
final _that = this;
switch (_that) {
case _ApiSkills():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiSkills value)?  $default,){
final _that = this;
switch (_that) {
case _ApiSkills() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> stack,  List<SkillCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiSkills() when $default != null:
return $default(_that.stack,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> stack,  List<SkillCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _ApiSkills():
return $default(_that.stack,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> stack,  List<SkillCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _ApiSkills() when $default != null:
return $default(_that.stack,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiSkills implements ApiSkills {
  const _ApiSkills({ List<String> stack = const <String>[],  List<SkillCategory> categories = const <SkillCategory>[]}): _stack = stack,_categories = categories;
  factory _ApiSkills.fromJson(Map<String, dynamic> json) => _$ApiSkillsFromJson(json);

/// Short "main stack" list.
 final  List<String> _stack;
/// Short "main stack" list.
@override@JsonKey() List<String> get stack {
  if (_stack is EqualUnmodifiableListView) return _stack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stack);
}

 final  List<SkillCategory> _categories;
@override@JsonKey() List<SkillCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ApiSkills
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiSkillsCopyWith<_ApiSkills> get copyWith => __$ApiSkillsCopyWithImpl<_ApiSkills>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiSkillsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiSkills&&const DeepCollectionEquality().equals(other.stack, _stack)&&const DeepCollectionEquality().equals(other.categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_stack),const DeepCollectionEquality().hash(_categories));
}

@override
String toString() {
    return 'ApiSkills(stack: $stack, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ApiSkillsCopyWith<$Res> implements $ApiSkillsCopyWith<$Res> {
  factory _$ApiSkillsCopyWith(_ApiSkills value, $Res Function(_ApiSkills) _then) = __$ApiSkillsCopyWithImpl;
@override @useResult
$Res call({
 List<String> stack, List<SkillCategory> categories
});




}
/// @nodoc
class __$ApiSkillsCopyWithImpl<$Res>
    implements _$ApiSkillsCopyWith<$Res> {
  __$ApiSkillsCopyWithImpl(this._self, this._then);

  final _ApiSkills _self;
  final $Res Function(_ApiSkills) _then;

/// Create a copy of ApiSkills
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stack = null,Object? categories = null,}) {
  return _then(_ApiSkills(
stack: null == stack ? _self._stack : stack // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<SkillCategory>,
  ));
}


}


/// @nodoc
mixin _$SkillCategory {

/// `langs`, `libs` or `tools`.
 String get code; String get name; List<Skill> get skills;
/// Create a copy of SkillCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkillCategoryCopyWith<SkillCategory> get copyWith => _$SkillCategoryCopyWithImpl<SkillCategory>(this as SkillCategory, _$identity);

  /// Serializes this SkillCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SkillCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillCategory&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.skills, _this.skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SkillCategory;
  return Object.hash(runtimeType,_this.code,_this.name,const DeepCollectionEquality().hash(_this.skills));
}

@override
String toString() {
  final _this = this as SkillCategory;
  return 'SkillCategory(code: ${_this.code}, name: ${_this.name}, skills: ${_this.skills})';
}


}

/// @nodoc
abstract mixin class $SkillCategoryCopyWith<$Res>  {
  factory $SkillCategoryCopyWith(SkillCategory value, $Res Function(SkillCategory) _then) = _$SkillCategoryCopyWithImpl;
@useResult
$Res call({
 String code, String name, List<Skill> skills
});




}
/// @nodoc
class _$SkillCategoryCopyWithImpl<$Res>
    implements $SkillCategoryCopyWith<$Res> {
  _$SkillCategoryCopyWithImpl(this._self, this._then);

  final SkillCategory _self;
  final $Res Function(SkillCategory) _then;

/// Create a copy of SkillCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? skills = null,}) {
  return _then(SkillCategory(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,
  ));
}

}


/// Adds pattern-matching-related methods to [SkillCategory].
extension SkillCategoryPatterns on SkillCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SkillCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SkillCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SkillCategory value)  $default,){
final _that = this;
switch (_that) {
case _SkillCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SkillCategory value)?  $default,){
final _that = this;
switch (_that) {
case _SkillCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  List<Skill> skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SkillCategory() when $default != null:
return $default(_that.code,_that.name,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  List<Skill> skills)  $default,) {final _that = this;
switch (_that) {
case _SkillCategory():
return $default(_that.code,_that.name,_that.skills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  List<Skill> skills)?  $default,) {final _that = this;
switch (_that) {
case _SkillCategory() when $default != null:
return $default(_that.code,_that.name,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SkillCategory implements SkillCategory {
  const _SkillCategory({required this.code, required this.name,  List<Skill> skills = const <Skill>[]}): _skills = skills;
  factory _SkillCategory.fromJson(Map<String, dynamic> json) => _$SkillCategoryFromJson(json);

/// `langs`, `libs` or `tools`.
@override final  String code;
@override final  String name;
 final  List<Skill> _skills;
@override@JsonKey() List<Skill> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}


/// Create a copy of SkillCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkillCategoryCopyWith<_SkillCategory> get copyWith => __$SkillCategoryCopyWithImpl<_SkillCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SkillCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkillCategory&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,name,const DeepCollectionEquality().hash(_skills));
}

@override
String toString() {
    return 'SkillCategory(code: $code, name: $name, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$SkillCategoryCopyWith<$Res> implements $SkillCategoryCopyWith<$Res> {
  factory _$SkillCategoryCopyWith(_SkillCategory value, $Res Function(_SkillCategory) _then) = __$SkillCategoryCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, List<Skill> skills
});




}
/// @nodoc
class __$SkillCategoryCopyWithImpl<$Res>
    implements _$SkillCategoryCopyWith<$Res> {
  __$SkillCategoryCopyWithImpl(this._self, this._then);

  final _SkillCategory _self;
  final $Res Function(_SkillCategory) _then;

/// Create a copy of SkillCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? skills = null,}) {
  return _then(_SkillCategory(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<Skill>,
  ));
}


}


/// @nodoc
mixin _$Skill {

 String get name;@JsonKey(unknownEnumValue: SkillLevel.bottom) SkillLevel get level;/// Only used in personal projects.
 bool get personalOnly;
/// Create a copy of Skill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkillCopyWith<Skill> get copyWith => _$SkillCopyWithImpl<Skill>(this as Skill, _$identity);

  /// Serializes this Skill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Skill;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Skill&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.personalOnly, _this.personalOnly) || other.personalOnly == _this.personalOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Skill;
  return Object.hash(runtimeType,_this.name,_this.level,_this.personalOnly);
}

@override
String toString() {
  final _this = this as Skill;
  return 'Skill(name: ${_this.name}, level: ${_this.level}, personalOnly: ${_this.personalOnly})';
}


}

/// @nodoc
abstract mixin class $SkillCopyWith<$Res>  {
  factory $SkillCopyWith(Skill value, $Res Function(Skill) _then) = _$SkillCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(unknownEnumValue: SkillLevel.bottom) SkillLevel level, bool personalOnly
});




}
/// @nodoc
class _$SkillCopyWithImpl<$Res>
    implements $SkillCopyWith<$Res> {
  _$SkillCopyWithImpl(this._self, this._then);

  final Skill _self;
  final $Res Function(Skill) _then;

/// Create a copy of Skill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? level = null,Object? personalOnly = null,}) {
  return _then(Skill(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as SkillLevel,personalOnly: null == personalOnly ? _self.personalOnly : personalOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Skill].
extension SkillPatterns on Skill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Skill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Skill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Skill value)  $default,){
final _that = this;
switch (_that) {
case _Skill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Skill value)?  $default,){
final _that = this;
switch (_that) {
case _Skill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(unknownEnumValue: SkillLevel.bottom)  SkillLevel level,  bool personalOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Skill() when $default != null:
return $default(_that.name,_that.level,_that.personalOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(unknownEnumValue: SkillLevel.bottom)  SkillLevel level,  bool personalOnly)  $default,) {final _that = this;
switch (_that) {
case _Skill():
return $default(_that.name,_that.level,_that.personalOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(unknownEnumValue: SkillLevel.bottom)  SkillLevel level,  bool personalOnly)?  $default,) {final _that = this;
switch (_that) {
case _Skill() when $default != null:
return $default(_that.name,_that.level,_that.personalOnly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Skill implements Skill {
  const _Skill({required this.name, @JsonKey(unknownEnumValue: SkillLevel.bottom) required this.level, this.personalOnly = false});
  factory _Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

@override final  String name;
@override@JsonKey(unknownEnumValue: SkillLevel.bottom) final  SkillLevel level;
/// Only used in personal projects.
@override@JsonKey() final  bool personalOnly;

/// Create a copy of Skill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkillCopyWith<_Skill> get copyWith => __$SkillCopyWithImpl<_Skill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SkillToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Skill&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.personalOnly, personalOnly) || other.personalOnly == personalOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,level,personalOnly);
}

@override
String toString() {
    return 'Skill(name: $name, level: $level, personalOnly: $personalOnly)';
}


}

/// @nodoc
abstract mixin class _$SkillCopyWith<$Res> implements $SkillCopyWith<$Res> {
  factory _$SkillCopyWith(_Skill value, $Res Function(_Skill) _then) = __$SkillCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(unknownEnumValue: SkillLevel.bottom) SkillLevel level, bool personalOnly
});




}
/// @nodoc
class __$SkillCopyWithImpl<$Res>
    implements _$SkillCopyWith<$Res> {
  __$SkillCopyWithImpl(this._self, this._then);

  final _Skill _self;
  final $Res Function(_Skill) _then;

/// Create a copy of Skill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? level = null,Object? personalOnly = null,}) {
  return _then(_Skill(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as SkillLevel,personalOnly: null == personalOnly ? _self.personalOnly : personalOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
