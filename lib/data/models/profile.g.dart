// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiProfile _$ApiProfileFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_ApiProfile',
  json,
  ($checkedConvert) {
    final val = _ApiProfile(
      name: $checkedConvert('name', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String),
      city: $checkedConvert('city', (v) => v as String),
      age: $checkedConvert('age', (v) => (v as num).toInt()),
      headline: $checkedConvert('headline', (v) => v as String),
      bio: $checkedConvert('bio', (v) => v as String),
      about: $checkedConvert('about', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      photo: $checkedConvert(
        'photo',
        (v) =>
            v == null ? null : ProfilePhoto.fromJson(v as Map<String, dynamic>),
      ),
      socials: $checkedConvert(
        'socials',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Social.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Social>[],
      ),
      facts: $checkedConvert(
        'facts',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Fact.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Fact>[],
      ),
      languages: $checkedConvert(
        'languages',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <SpokenLanguage>[],
      ),
      hobbies: $checkedConvert(
        'hobbies',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Hobby.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <Hobby>[],
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ApiProfileToJson(_ApiProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'city': instance.city,
      'age': instance.age,
      'headline': instance.headline,
      'bio': instance.bio,
      'about': instance.about,
      'title': instance.title,
      'photo': instance.photo?.toJson(),
      'socials': instance.socials.map((e) => e.toJson()).toList(),
      'facts': instance.facts.map((e) => e.toJson()).toList(),
      'languages': instance.languages.map((e) => e.toJson()).toList(),
      'hobbies': instance.hobbies.map((e) => e.toJson()).toList(),
    };

_ProfilePhoto _$ProfilePhotoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProfilePhoto', json, ($checkedConvert) {
      final val = _ProfilePhoto(
        url: $checkedConvert('url', (v) => v as String),
        alt: $checkedConvert('alt', (v) => v as String? ?? ''),
      );
      return val;
    });

Map<String, dynamic> _$ProfilePhotoToJson(_ProfilePhoto instance) =>
    <String, dynamic>{'url': instance.url, 'alt': instance.alt};

_Social _$SocialFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Social', json, ($checkedConvert) {
      final val = _Social(
        network: $checkedConvert('network', (v) => v as String),
        url: $checkedConvert('url', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SocialToJson(_Social instance) => <String, dynamic>{
  'network': instance.network,
  'url': instance.url,
};

_Fact _$FactFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Fact', json, ($checkedConvert) {
      final val = _Fact(
        label: $checkedConvert('label', (v) => v as String),
        value: $checkedConvert('value', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FactToJson(_Fact instance) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
};

_SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SpokenLanguage', json, ($checkedConvert) {
      final val = _SpokenLanguage(
        name: $checkedConvert('name', (v) => v as String),
        level: $checkedConvert('level', (v) => v as String),
        percent: $checkedConvert('percent', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SpokenLanguageToJson(_SpokenLanguage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'percent': instance.percent,
    };

_Hobby _$HobbyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Hobby', json, ($checkedConvert) {
      final val = _Hobby(
        name: $checkedConvert('name', (v) => v as String),
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$HobbyToJson(_Hobby instance) => <String, dynamic>{
  'name': instance.name,
  'reason': instance.reason,
};
