// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiExperience {

 String get id; ExperienceKind get kind; String get title; String? get degree; String? get organization; DateTime get start;/// `null` means the experience is ongoing.
 DateTime? get end; List<String> get tasks; List<String> get skills; List<String> get projectIds;
/// Create a copy of ApiExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiExperienceCopyWith<ApiExperience> get copyWith => _$ApiExperienceCopyWithImpl<ApiExperience>(this as ApiExperience, _$identity);

  /// Serializes this ApiExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiExperience;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiExperience&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.degree, _this.degree) || other.degree == _this.degree)&&(identical(other.organization, _this.organization) || other.organization == _this.organization)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&const DeepCollectionEquality().equals(other.tasks, _this.tasks)&&const DeepCollectionEquality().equals(other.skills, _this.skills)&&const DeepCollectionEquality().equals(other.projectIds, _this.projectIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiExperience;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.title,_this.degree,_this.organization,_this.start,_this.end,const DeepCollectionEquality().hash(_this.tasks),const DeepCollectionEquality().hash(_this.skills),const DeepCollectionEquality().hash(_this.projectIds));
}

@override
String toString() {
  final _this = this as ApiExperience;
  return 'ApiExperience(id: ${_this.id}, kind: ${_this.kind}, title: ${_this.title}, degree: ${_this.degree}, organization: ${_this.organization}, start: ${_this.start}, end: ${_this.end}, tasks: ${_this.tasks}, skills: ${_this.skills}, projectIds: ${_this.projectIds})';
}


}

/// @nodoc
abstract mixin class $ApiExperienceCopyWith<$Res>  {
  factory $ApiExperienceCopyWith(ApiExperience value, $Res Function(ApiExperience) _then) = _$ApiExperienceCopyWithImpl;
@useResult
$Res call({
 String id, ExperienceKind kind, String title, String? degree, String? organization, DateTime start, DateTime? end, List<String> tasks, List<String> skills, List<String> projectIds
});




}
/// @nodoc
class _$ApiExperienceCopyWithImpl<$Res>
    implements $ApiExperienceCopyWith<$Res> {
  _$ApiExperienceCopyWithImpl(this._self, this._then);

  final ApiExperience _self;
  final $Res Function(ApiExperience) _then;

/// Create a copy of ApiExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? degree = freezed,Object? organization = freezed,Object? start = null,Object? end = freezed,Object? tasks = null,Object? skills = null,Object? projectIds = null,}) {
  return _then(ApiExperience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ExperienceKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<String>,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,projectIds: null == projectIds ? _self.projectIds : projectIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiExperience].
extension ApiExperiencePatterns on ApiExperience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiExperience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiExperience value)  $default,){
final _that = this;
switch (_that) {
case _ApiExperience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiExperience value)?  $default,){
final _that = this;
switch (_that) {
case _ApiExperience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ExperienceKind kind,  String title,  String? degree,  String? organization,  DateTime start,  DateTime? end,  List<String> tasks,  List<String> skills,  List<String> projectIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiExperience() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.degree,_that.organization,_that.start,_that.end,_that.tasks,_that.skills,_that.projectIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ExperienceKind kind,  String title,  String? degree,  String? organization,  DateTime start,  DateTime? end,  List<String> tasks,  List<String> skills,  List<String> projectIds)  $default,) {final _that = this;
switch (_that) {
case _ApiExperience():
return $default(_that.id,_that.kind,_that.title,_that.degree,_that.organization,_that.start,_that.end,_that.tasks,_that.skills,_that.projectIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ExperienceKind kind,  String title,  String? degree,  String? organization,  DateTime start,  DateTime? end,  List<String> tasks,  List<String> skills,  List<String> projectIds)?  $default,) {final _that = this;
switch (_that) {
case _ApiExperience() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.degree,_that.organization,_that.start,_that.end,_that.tasks,_that.skills,_that.projectIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiExperience extends ApiExperience {
  const _ApiExperience({required this.id, required this.kind, required this.title, this.degree, this.organization, required this.start, this.end,  List<String> tasks = const <String>[],  List<String> skills = const <String>[],  List<String> projectIds = const <String>[]}): _tasks = tasks,_skills = skills,_projectIds = projectIds,super._();
  factory _ApiExperience.fromJson(Map<String, dynamic> json) => _$ApiExperienceFromJson(json);

@override final  String id;
@override final  ExperienceKind kind;
@override final  String title;
@override final  String? degree;
@override final  String? organization;
@override final  DateTime start;
/// `null` means the experience is ongoing.
@override final  DateTime? end;
 final  List<String> _tasks;
@override@JsonKey() List<String> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  List<String> _skills;
@override@JsonKey() List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

 final  List<String> _projectIds;
@override@JsonKey() List<String> get projectIds {
  if (_projectIds is EqualUnmodifiableListView) return _projectIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectIds);
}


/// Create a copy of ApiExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiExperienceCopyWith<_ApiExperience> get copyWith => __$ApiExperienceCopyWithImpl<_ApiExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiExperience&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&const DeepCollectionEquality().equals(other.tasks, _tasks)&&const DeepCollectionEquality().equals(other.skills, _skills)&&const DeepCollectionEquality().equals(other.projectIds, _projectIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,title,degree,organization,start,end,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_projectIds));
}

@override
String toString() {
    return 'ApiExperience(id: $id, kind: $kind, title: $title, degree: $degree, organization: $organization, start: $start, end: $end, tasks: $tasks, skills: $skills, projectIds: $projectIds)';
}


}

/// @nodoc
abstract mixin class _$ApiExperienceCopyWith<$Res> implements $ApiExperienceCopyWith<$Res> {
  factory _$ApiExperienceCopyWith(_ApiExperience value, $Res Function(_ApiExperience) _then) = __$ApiExperienceCopyWithImpl;
@override @useResult
$Res call({
 String id, ExperienceKind kind, String title, String? degree, String? organization, DateTime start, DateTime? end, List<String> tasks, List<String> skills, List<String> projectIds
});




}
/// @nodoc
class __$ApiExperienceCopyWithImpl<$Res>
    implements _$ApiExperienceCopyWith<$Res> {
  __$ApiExperienceCopyWithImpl(this._self, this._then);

  final _ApiExperience _self;
  final $Res Function(_ApiExperience) _then;

/// Create a copy of ApiExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? degree = freezed,Object? organization = freezed,Object? start = null,Object? end = freezed,Object? tasks = null,Object? skills = null,Object? projectIds = null,}) {
  return _then(_ApiExperience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ExperienceKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<String>,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,projectIds: null == projectIds ? _self._projectIds : projectIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
