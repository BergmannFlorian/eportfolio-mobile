// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiProject {

 String get id; String get name; String? get url;/// Project image, cropped 16:10. Site-relative `/media/…` path.
 String? get image;/// Description of [image] in the requested language.
 String? get imageAlt;/// `null` means a personal project.
 String? get experienceId; bool get featured;/// Description paragraphs.
 List<String> get tasks;/// Highlights.
 List<String> get details;/// Technologies.
 List<String> get skills;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ProjectKind? get kind; int? get year;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ProjectStatus? get status; String? get hosting;/// Usage example, usually a shell command.
 String? get snippet;/// Display order (1 = first), numbered separately for personal and
/// client projects.
 int get position;
/// Create a copy of ApiProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiProjectCopyWith<ApiProject> get copyWith => _$ApiProjectCopyWithImpl<ApiProject>(this as ApiProject, _$identity);

  /// Serializes this ApiProject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiProject;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiProject&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.imageAlt, _this.imageAlt) || other.imageAlt == _this.imageAlt)&&(identical(other.experienceId, _this.experienceId) || other.experienceId == _this.experienceId)&&(identical(other.featured, _this.featured) || other.featured == _this.featured)&&const DeepCollectionEquality().equals(other.tasks, _this.tasks)&&const DeepCollectionEquality().equals(other.details, _this.details)&&const DeepCollectionEquality().equals(other.skills, _this.skills)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.hosting, _this.hosting) || other.hosting == _this.hosting)&&(identical(other.snippet, _this.snippet) || other.snippet == _this.snippet)&&(identical(other.position, _this.position) || other.position == _this.position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiProject;
  return Object.hash(runtimeType,_this.id,_this.name,_this.url,_this.image,_this.imageAlt,_this.experienceId,_this.featured,const DeepCollectionEquality().hash(_this.tasks),const DeepCollectionEquality().hash(_this.details),const DeepCollectionEquality().hash(_this.skills),_this.kind,_this.year,_this.status,_this.hosting,_this.snippet,_this.position);
}

@override
String toString() {
  final _this = this as ApiProject;
  return 'ApiProject(id: ${_this.id}, name: ${_this.name}, url: ${_this.url}, image: ${_this.image}, imageAlt: ${_this.imageAlt}, experienceId: ${_this.experienceId}, featured: ${_this.featured}, tasks: ${_this.tasks}, details: ${_this.details}, skills: ${_this.skills}, kind: ${_this.kind}, year: ${_this.year}, status: ${_this.status}, hosting: ${_this.hosting}, snippet: ${_this.snippet}, position: ${_this.position})';
}


}

/// @nodoc
abstract mixin class $ApiProjectCopyWith<$Res>  {
  factory $ApiProjectCopyWith(ApiProject value, $Res Function(ApiProject) _then) = _$ApiProjectCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? url, String? image, String? imageAlt, String? experienceId, bool featured, List<String> tasks, List<String> details, List<String> skills,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ProjectKind? kind, int? year,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ProjectStatus? status, String? hosting, String? snippet, int position
});




}
/// @nodoc
class _$ApiProjectCopyWithImpl<$Res>
    implements $ApiProjectCopyWith<$Res> {
  _$ApiProjectCopyWithImpl(this._self, this._then);

  final ApiProject _self;
  final $Res Function(ApiProject) _then;

/// Create a copy of ApiProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = freezed,Object? image = freezed,Object? imageAlt = freezed,Object? experienceId = freezed,Object? featured = null,Object? tasks = null,Object? details = null,Object? skills = null,Object? kind = freezed,Object? year = freezed,Object? status = freezed,Object? hosting = freezed,Object? snippet = freezed,Object? position = null,}) {
  return _then(ApiProject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,imageAlt: freezed == imageAlt ? _self.imageAlt : imageAlt // ignore: cast_nullable_to_non_nullable
as String?,experienceId: freezed == experienceId ? _self.experienceId : experienceId // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<String>,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as List<String>,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ProjectKind?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus?,hosting: freezed == hosting ? _self.hosting : hosting // ignore: cast_nullable_to_non_nullable
as String?,snippet: freezed == snippet ? _self.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiProject].
extension ApiProjectPatterns on ApiProject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiProject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiProject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiProject value)  $default,){
final _that = this;
switch (_that) {
case _ApiProject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiProject value)?  $default,){
final _that = this;
switch (_that) {
case _ApiProject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? url,  String? image,  String? imageAlt,  String? experienceId,  bool featured,  List<String> tasks,  List<String> details,  List<String> skills, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ProjectKind? kind,  int? year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ProjectStatus? status,  String? hosting,  String? snippet,  int position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiProject() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.image,_that.imageAlt,_that.experienceId,_that.featured,_that.tasks,_that.details,_that.skills,_that.kind,_that.year,_that.status,_that.hosting,_that.snippet,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? url,  String? image,  String? imageAlt,  String? experienceId,  bool featured,  List<String> tasks,  List<String> details,  List<String> skills, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ProjectKind? kind,  int? year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ProjectStatus? status,  String? hosting,  String? snippet,  int position)  $default,) {final _that = this;
switch (_that) {
case _ApiProject():
return $default(_that.id,_that.name,_that.url,_that.image,_that.imageAlt,_that.experienceId,_that.featured,_that.tasks,_that.details,_that.skills,_that.kind,_that.year,_that.status,_that.hosting,_that.snippet,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? url,  String? image,  String? imageAlt,  String? experienceId,  bool featured,  List<String> tasks,  List<String> details,  List<String> skills, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ProjectKind? kind,  int? year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ProjectStatus? status,  String? hosting,  String? snippet,  int position)?  $default,) {final _that = this;
switch (_that) {
case _ApiProject() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.image,_that.imageAlt,_that.experienceId,_that.featured,_that.tasks,_that.details,_that.skills,_that.kind,_that.year,_that.status,_that.hosting,_that.snippet,_that.position);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiProject extends ApiProject {
  const _ApiProject({required this.id, required this.name, this.url, this.image, this.imageAlt, this.experienceId, this.featured = false,  List<String> tasks = const <String>[],  List<String> details = const <String>[],  List<String> skills = const <String>[], @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.kind, this.year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status, this.hosting, this.snippet, this.position = 0}): _tasks = tasks,_details = details,_skills = skills,super._();
  factory _ApiProject.fromJson(Map<String, dynamic> json) => _$ApiProjectFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? url;
/// Project image, cropped 16:10. Site-relative `/media/…` path.
@override final  String? image;
/// Description of [image] in the requested language.
@override final  String? imageAlt;
/// `null` means a personal project.
@override final  String? experienceId;
@override@JsonKey() final  bool featured;
/// Description paragraphs.
 final  List<String> _tasks;
/// Description paragraphs.
@override@JsonKey() List<String> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

/// Highlights.
 final  List<String> _details;
/// Highlights.
@override@JsonKey() List<String> get details {
  if (_details is EqualUnmodifiableListView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_details);
}

/// Technologies.
 final  List<String> _skills;
/// Technologies.
@override@JsonKey() List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ProjectKind? kind;
@override final  int? year;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ProjectStatus? status;
@override final  String? hosting;
/// Usage example, usually a shell command.
@override final  String? snippet;
/// Display order (1 = first), numbered separately for personal and
/// client projects.
@override@JsonKey() final  int position;

/// Create a copy of ApiProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiProjectCopyWith<_ApiProject> get copyWith => __$ApiProjectCopyWithImpl<_ApiProject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiProjectToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiProject&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.image, image) || other.image == image)&&(identical(other.imageAlt, imageAlt) || other.imageAlt == imageAlt)&&(identical(other.experienceId, experienceId) || other.experienceId == experienceId)&&(identical(other.featured, featured) || other.featured == featured)&&const DeepCollectionEquality().equals(other.tasks, _tasks)&&const DeepCollectionEquality().equals(other.details, _details)&&const DeepCollectionEquality().equals(other.skills, _skills)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.year, year) || other.year == year)&&(identical(other.status, status) || other.status == status)&&(identical(other.hosting, hosting) || other.hosting == hosting)&&(identical(other.snippet, snippet) || other.snippet == snippet)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,url,image,imageAlt,experienceId,featured,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_details),const DeepCollectionEquality().hash(_skills),kind,year,status,hosting,snippet,position);
}

@override
String toString() {
    return 'ApiProject(id: $id, name: $name, url: $url, image: $image, imageAlt: $imageAlt, experienceId: $experienceId, featured: $featured, tasks: $tasks, details: $details, skills: $skills, kind: $kind, year: $year, status: $status, hosting: $hosting, snippet: $snippet, position: $position)';
}


}

/// @nodoc
abstract mixin class _$ApiProjectCopyWith<$Res> implements $ApiProjectCopyWith<$Res> {
  factory _$ApiProjectCopyWith(_ApiProject value, $Res Function(_ApiProject) _then) = __$ApiProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? url, String? image, String? imageAlt, String? experienceId, bool featured, List<String> tasks, List<String> details, List<String> skills,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ProjectKind? kind, int? year,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ProjectStatus? status, String? hosting, String? snippet, int position
});




}
/// @nodoc
class __$ApiProjectCopyWithImpl<$Res>
    implements _$ApiProjectCopyWith<$Res> {
  __$ApiProjectCopyWithImpl(this._self, this._then);

  final _ApiProject _self;
  final $Res Function(_ApiProject) _then;

/// Create a copy of ApiProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = freezed,Object? image = freezed,Object? imageAlt = freezed,Object? experienceId = freezed,Object? featured = null,Object? tasks = null,Object? details = null,Object? skills = null,Object? kind = freezed,Object? year = freezed,Object? status = freezed,Object? hosting = freezed,Object? snippet = freezed,Object? position = null,}) {
  return _then(_ApiProject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,imageAlt: freezed == imageAlt ? _self.imageAlt : imageAlt // ignore: cast_nullable_to_non_nullable
as String?,experienceId: freezed == experienceId ? _self.experienceId : experienceId // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<String>,details: null == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as List<String>,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ProjectKind?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus?,hosting: freezed == hosting ? _self.hosting : hosting // ignore: cast_nullable_to_non_nullable
as String?,snippet: freezed == snippet ? _self.snippet : snippet // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
