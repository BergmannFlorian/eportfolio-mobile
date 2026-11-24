// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiProfile {

 String get name; String get email; String get city; int get age; String get headline; String get bio; String get about; String get title; List<Social> get socials; List<Fact> get facts; List<SpokenLanguage> get languages; List<Hobby> get hobbies;
/// Create a copy of ApiProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiProfileCopyWith<ApiProfile> get copyWith => _$ApiProfileCopyWithImpl<ApiProfile>(this as ApiProfile, _$identity);

  /// Serializes this ApiProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApiProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiProfile&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.age, _this.age) || other.age == _this.age)&&(identical(other.headline, _this.headline) || other.headline == _this.headline)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.about, _this.about) || other.about == _this.about)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.socials, _this.socials)&&const DeepCollectionEquality().equals(other.facts, _this.facts)&&const DeepCollectionEquality().equals(other.languages, _this.languages)&&const DeepCollectionEquality().equals(other.hobbies, _this.hobbies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApiProfile;
  return Object.hash(runtimeType,_this.name,_this.email,_this.city,_this.age,_this.headline,_this.bio,_this.about,_this.title,const DeepCollectionEquality().hash(_this.socials),const DeepCollectionEquality().hash(_this.facts),const DeepCollectionEquality().hash(_this.languages),const DeepCollectionEquality().hash(_this.hobbies));
}

@override
String toString() {
  final _this = this as ApiProfile;
  return 'ApiProfile(name: ${_this.name}, email: ${_this.email}, city: ${_this.city}, age: ${_this.age}, headline: ${_this.headline}, bio: ${_this.bio}, about: ${_this.about}, title: ${_this.title}, socials: ${_this.socials}, facts: ${_this.facts}, languages: ${_this.languages}, hobbies: ${_this.hobbies})';
}


}

/// @nodoc
abstract mixin class $ApiProfileCopyWith<$Res>  {
  factory $ApiProfileCopyWith(ApiProfile value, $Res Function(ApiProfile) _then) = _$ApiProfileCopyWithImpl;
@useResult
$Res call({
 String name, String email, String city, int age, String headline, String bio, String about, String title, List<Social> socials, List<Fact> facts, List<SpokenLanguage> languages, List<Hobby> hobbies
});




}
/// @nodoc
class _$ApiProfileCopyWithImpl<$Res>
    implements $ApiProfileCopyWith<$Res> {
  _$ApiProfileCopyWithImpl(this._self, this._then);

  final ApiProfile _self;
  final $Res Function(ApiProfile) _then;

/// Create a copy of ApiProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? city = null,Object? age = null,Object? headline = null,Object? bio = null,Object? about = null,Object? title = null,Object? socials = null,Object? facts = null,Object? languages = null,Object? hobbies = null,}) {
  return _then(ApiProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,about: null == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,socials: null == socials ? _self.socials : socials // ignore: cast_nullable_to_non_nullable
as List<Social>,facts: null == facts ? _self.facts : facts // ignore: cast_nullable_to_non_nullable
as List<Fact>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<SpokenLanguage>,hobbies: null == hobbies ? _self.hobbies : hobbies // ignore: cast_nullable_to_non_nullable
as List<Hobby>,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiProfile].
extension ApiProfilePatterns on ApiProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiProfile value)  $default,){
final _that = this;
switch (_that) {
case _ApiProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ApiProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String city,  int age,  String headline,  String bio,  String about,  String title,  List<Social> socials,  List<Fact> facts,  List<SpokenLanguage> languages,  List<Hobby> hobbies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiProfile() when $default != null:
return $default(_that.name,_that.email,_that.city,_that.age,_that.headline,_that.bio,_that.about,_that.title,_that.socials,_that.facts,_that.languages,_that.hobbies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String city,  int age,  String headline,  String bio,  String about,  String title,  List<Social> socials,  List<Fact> facts,  List<SpokenLanguage> languages,  List<Hobby> hobbies)  $default,) {final _that = this;
switch (_that) {
case _ApiProfile():
return $default(_that.name,_that.email,_that.city,_that.age,_that.headline,_that.bio,_that.about,_that.title,_that.socials,_that.facts,_that.languages,_that.hobbies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String city,  int age,  String headline,  String bio,  String about,  String title,  List<Social> socials,  List<Fact> facts,  List<SpokenLanguage> languages,  List<Hobby> hobbies)?  $default,) {final _that = this;
switch (_that) {
case _ApiProfile() when $default != null:
return $default(_that.name,_that.email,_that.city,_that.age,_that.headline,_that.bio,_that.about,_that.title,_that.socials,_that.facts,_that.languages,_that.hobbies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiProfile implements ApiProfile {
  const _ApiProfile({required this.name, required this.email, required this.city, required this.age, required this.headline, required this.bio, required this.about, required this.title,  List<Social> socials = const <Social>[],  List<Fact> facts = const <Fact>[],  List<SpokenLanguage> languages = const <SpokenLanguage>[],  List<Hobby> hobbies = const <Hobby>[]}): _socials = socials,_facts = facts,_languages = languages,_hobbies = hobbies;
  factory _ApiProfile.fromJson(Map<String, dynamic> json) => _$ApiProfileFromJson(json);

@override final  String name;
@override final  String email;
@override final  String city;
@override final  int age;
@override final  String headline;
@override final  String bio;
@override final  String about;
@override final  String title;
 final  List<Social> _socials;
@override@JsonKey() List<Social> get socials {
  if (_socials is EqualUnmodifiableListView) return _socials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socials);
}

 final  List<Fact> _facts;
@override@JsonKey() List<Fact> get facts {
  if (_facts is EqualUnmodifiableListView) return _facts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facts);
}

 final  List<SpokenLanguage> _languages;
@override@JsonKey() List<SpokenLanguage> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

 final  List<Hobby> _hobbies;
@override@JsonKey() List<Hobby> get hobbies {
  if (_hobbies is EqualUnmodifiableListView) return _hobbies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hobbies);
}


/// Create a copy of ApiProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiProfileCopyWith<_ApiProfile> get copyWith => __$ApiProfileCopyWithImpl<_ApiProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.age, age) || other.age == age)&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.about, about) || other.about == about)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.socials, _socials)&&const DeepCollectionEquality().equals(other.facts, _facts)&&const DeepCollectionEquality().equals(other.languages, _languages)&&const DeepCollectionEquality().equals(other.hobbies, _hobbies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,email,city,age,headline,bio,about,title,const DeepCollectionEquality().hash(_socials),const DeepCollectionEquality().hash(_facts),const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_hobbies));
}

@override
String toString() {
    return 'ApiProfile(name: $name, email: $email, city: $city, age: $age, headline: $headline, bio: $bio, about: $about, title: $title, socials: $socials, facts: $facts, languages: $languages, hobbies: $hobbies)';
}


}

/// @nodoc
abstract mixin class _$ApiProfileCopyWith<$Res> implements $ApiProfileCopyWith<$Res> {
  factory _$ApiProfileCopyWith(_ApiProfile value, $Res Function(_ApiProfile) _then) = __$ApiProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String city, int age, String headline, String bio, String about, String title, List<Social> socials, List<Fact> facts, List<SpokenLanguage> languages, List<Hobby> hobbies
});




}
/// @nodoc
class __$ApiProfileCopyWithImpl<$Res>
    implements _$ApiProfileCopyWith<$Res> {
  __$ApiProfileCopyWithImpl(this._self, this._then);

  final _ApiProfile _self;
  final $Res Function(_ApiProfile) _then;

/// Create a copy of ApiProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? city = null,Object? age = null,Object? headline = null,Object? bio = null,Object? about = null,Object? title = null,Object? socials = null,Object? facts = null,Object? languages = null,Object? hobbies = null,}) {
  return _then(_ApiProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,about: null == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,socials: null == socials ? _self._socials : socials // ignore: cast_nullable_to_non_nullable
as List<Social>,facts: null == facts ? _self._facts : facts // ignore: cast_nullable_to_non_nullable
as List<Fact>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<SpokenLanguage>,hobbies: null == hobbies ? _self._hobbies : hobbies // ignore: cast_nullable_to_non_nullable
as List<Hobby>,
  ));
}


}


/// @nodoc
mixin _$Social {

 String get network; String get url;
/// Create a copy of Social
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialCopyWith<Social> get copyWith => _$SocialCopyWithImpl<Social>(this as Social, _$identity);

  /// Serializes this Social to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Social;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Social&&(identical(other.network, _this.network) || other.network == _this.network)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Social;
  return Object.hash(runtimeType,_this.network,_this.url);
}

@override
String toString() {
  final _this = this as Social;
  return 'Social(network: ${_this.network}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $SocialCopyWith<$Res>  {
  factory $SocialCopyWith(Social value, $Res Function(Social) _then) = _$SocialCopyWithImpl;
@useResult
$Res call({
 String network, String url
});




}
/// @nodoc
class _$SocialCopyWithImpl<$Res>
    implements $SocialCopyWith<$Res> {
  _$SocialCopyWithImpl(this._self, this._then);

  final Social _self;
  final $Res Function(Social) _then;

/// Create a copy of Social
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? network = null,Object? url = null,}) {
  return _then(Social(
network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Social].
extension SocialPatterns on Social {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Social value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Social() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Social value)  $default,){
final _that = this;
switch (_that) {
case _Social():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Social value)?  $default,){
final _that = this;
switch (_that) {
case _Social() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String network,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Social() when $default != null:
return $default(_that.network,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String network,  String url)  $default,) {final _that = this;
switch (_that) {
case _Social():
return $default(_that.network,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String network,  String url)?  $default,) {final _that = this;
switch (_that) {
case _Social() when $default != null:
return $default(_that.network,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Social implements Social {
  const _Social({required this.network, required this.url});
  factory _Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

@override final  String network;
@override final  String url;

/// Create a copy of Social
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialCopyWith<_Social> get copyWith => __$SocialCopyWithImpl<_Social>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Social&&(identical(other.network, network) || other.network == network)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,network,url);
}

@override
String toString() {
    return 'Social(network: $network, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SocialCopyWith<$Res> implements $SocialCopyWith<$Res> {
  factory _$SocialCopyWith(_Social value, $Res Function(_Social) _then) = __$SocialCopyWithImpl;
@override @useResult
$Res call({
 String network, String url
});




}
/// @nodoc
class __$SocialCopyWithImpl<$Res>
    implements _$SocialCopyWith<$Res> {
  __$SocialCopyWithImpl(this._self, this._then);

  final _Social _self;
  final $Res Function(_Social) _then;

/// Create a copy of Social
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? network = null,Object? url = null,}) {
  return _then(_Social(
network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Fact {

 String get label; String get value;
/// Create a copy of Fact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactCopyWith<Fact> get copyWith => _$FactCopyWithImpl<Fact>(this as Fact, _$identity);

  /// Serializes this Fact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Fact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fact&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value, _this.value) || other.value == _this.value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Fact;
  return Object.hash(runtimeType,_this.label,_this.value);
}

@override
String toString() {
  final _this = this as Fact;
  return 'Fact(label: ${_this.label}, value: ${_this.value})';
}


}

/// @nodoc
abstract mixin class $FactCopyWith<$Res>  {
  factory $FactCopyWith(Fact value, $Res Function(Fact) _then) = _$FactCopyWithImpl;
@useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class _$FactCopyWithImpl<$Res>
    implements $FactCopyWith<$Res> {
  _$FactCopyWithImpl(this._self, this._then);

  final Fact _self;
  final $Res Function(Fact) _then;

/// Create a copy of Fact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(Fact(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Fact].
extension FactPatterns on Fact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Fact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Fact value)  $default,){
final _that = this;
switch (_that) {
case _Fact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Fact value)?  $default,){
final _that = this;
switch (_that) {
case _Fact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fact() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value)  $default,) {final _that = this;
switch (_that) {
case _Fact():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value)?  $default,) {final _that = this;
switch (_that) {
case _Fact() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Fact implements Fact {
  const _Fact({required this.label, required this.value});
  factory _Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

@override final  String label;
@override final  String value;

/// Create a copy of Fact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactCopyWith<_Fact> get copyWith => __$FactCopyWithImpl<_Fact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fact&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,value);
}

@override
String toString() {
    return 'Fact(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$FactCopyWith<$Res> implements $FactCopyWith<$Res> {
  factory _$FactCopyWith(_Fact value, $Res Function(_Fact) _then) = __$FactCopyWithImpl;
@override @useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class __$FactCopyWithImpl<$Res>
    implements _$FactCopyWith<$Res> {
  __$FactCopyWithImpl(this._self, this._then);

  final _Fact _self;
  final $Res Function(_Fact) _then;

/// Create a copy of Fact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_Fact(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpokenLanguage {

 String get name; String get level; int get percent;
/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpokenLanguageCopyWith<SpokenLanguage> get copyWith => _$SpokenLanguageCopyWithImpl<SpokenLanguage>(this as SpokenLanguage, _$identity);

  /// Serializes this SpokenLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SpokenLanguage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpokenLanguage&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.percent, _this.percent) || other.percent == _this.percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SpokenLanguage;
  return Object.hash(runtimeType,_this.name,_this.level,_this.percent);
}

@override
String toString() {
  final _this = this as SpokenLanguage;
  return 'SpokenLanguage(name: ${_this.name}, level: ${_this.level}, percent: ${_this.percent})';
}


}

/// @nodoc
abstract mixin class $SpokenLanguageCopyWith<$Res>  {
  factory $SpokenLanguageCopyWith(SpokenLanguage value, $Res Function(SpokenLanguage) _then) = _$SpokenLanguageCopyWithImpl;
@useResult
$Res call({
 String name, String level, int percent
});




}
/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._self, this._then);

  final SpokenLanguage _self;
  final $Res Function(SpokenLanguage) _then;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? level = null,Object? percent = null,}) {
  return _then(SpokenLanguage(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SpokenLanguage].
extension SpokenLanguagePatterns on SpokenLanguage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpokenLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpokenLanguage value)  $default,){
final _that = this;
switch (_that) {
case _SpokenLanguage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpokenLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String level,  int percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that.name,_that.level,_that.percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String level,  int percent)  $default,) {final _that = this;
switch (_that) {
case _SpokenLanguage():
return $default(_that.name,_that.level,_that.percent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String level,  int percent)?  $default,) {final _that = this;
switch (_that) {
case _SpokenLanguage() when $default != null:
return $default(_that.name,_that.level,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpokenLanguage implements SpokenLanguage {
  const _SpokenLanguage({required this.name, required this.level, required this.percent});
  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);

@override final  String name;
@override final  String level;
@override final  int percent;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith => __$SpokenLanguageCopyWithImpl<_SpokenLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpokenLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpokenLanguage&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,level,percent);
}

@override
String toString() {
    return 'SpokenLanguage(name: $name, level: $level, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$SpokenLanguageCopyWith<$Res> implements $SpokenLanguageCopyWith<$Res> {
  factory _$SpokenLanguageCopyWith(_SpokenLanguage value, $Res Function(_SpokenLanguage) _then) = __$SpokenLanguageCopyWithImpl;
@override @useResult
$Res call({
 String name, String level, int percent
});




}
/// @nodoc
class __$SpokenLanguageCopyWithImpl<$Res>
    implements _$SpokenLanguageCopyWith<$Res> {
  __$SpokenLanguageCopyWithImpl(this._self, this._then);

  final _SpokenLanguage _self;
  final $Res Function(_SpokenLanguage) _then;

/// Create a copy of SpokenLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? level = null,Object? percent = null,}) {
  return _then(_SpokenLanguage(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Hobby {

 String get name; String get reason;
/// Create a copy of Hobby
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HobbyCopyWith<Hobby> get copyWith => _$HobbyCopyWithImpl<Hobby>(this as Hobby, _$identity);

  /// Serializes this Hobby to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Hobby;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hobby&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Hobby;
  return Object.hash(runtimeType,_this.name,_this.reason);
}

@override
String toString() {
  final _this = this as Hobby;
  return 'Hobby(name: ${_this.name}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $HobbyCopyWith<$Res>  {
  factory $HobbyCopyWith(Hobby value, $Res Function(Hobby) _then) = _$HobbyCopyWithImpl;
@useResult
$Res call({
 String name, String reason
});




}
/// @nodoc
class _$HobbyCopyWithImpl<$Res>
    implements $HobbyCopyWith<$Res> {
  _$HobbyCopyWithImpl(this._self, this._then);

  final Hobby _self;
  final $Res Function(Hobby) _then;

/// Create a copy of Hobby
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? reason = null,}) {
  return _then(Hobby(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Hobby].
extension HobbyPatterns on Hobby {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hobby value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hobby() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hobby value)  $default,){
final _that = this;
switch (_that) {
case _Hobby():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hobby value)?  $default,){
final _that = this;
switch (_that) {
case _Hobby() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hobby() when $default != null:
return $default(_that.name,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String reason)  $default,) {final _that = this;
switch (_that) {
case _Hobby():
return $default(_that.name,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _Hobby() when $default != null:
return $default(_that.name,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hobby implements Hobby {
  const _Hobby({required this.name, required this.reason});
  factory _Hobby.fromJson(Map<String, dynamic> json) => _$HobbyFromJson(json);

@override final  String name;
@override final  String reason;

/// Create a copy of Hobby
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HobbyCopyWith<_Hobby> get copyWith => __$HobbyCopyWithImpl<_Hobby>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HobbyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hobby&&(identical(other.name, name) || other.name == name)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,reason);
}

@override
String toString() {
    return 'Hobby(name: $name, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$HobbyCopyWith<$Res> implements $HobbyCopyWith<$Res> {
  factory _$HobbyCopyWith(_Hobby value, $Res Function(_Hobby) _then) = __$HobbyCopyWithImpl;
@override @useResult
$Res call({
 String name, String reason
});




}
/// @nodoc
class __$HobbyCopyWithImpl<$Res>
    implements _$HobbyCopyWith<$Res> {
  __$HobbyCopyWithImpl(this._self, this._then);

  final _Hobby _self;
  final $Res Function(_Hobby) _then;

/// Create a copy of Hobby
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? reason = null,}) {
  return _then(_Hobby(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
