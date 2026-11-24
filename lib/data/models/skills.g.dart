// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiSkills _$ApiSkillsFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_ApiSkills',
  json,
  ($checkedConvert) {
    final val = _ApiSkills(
      stack: $checkedConvert(
        'stack',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ??
            const <String>[],
      ),
      categories: $checkedConvert(
        'categories',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => SkillCategory.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const <SkillCategory>[],
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ApiSkillsToJson(_ApiSkills instance) =>
    <String, dynamic>{
      'stack': instance.stack,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };

_SkillCategory _$SkillCategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SkillCategory', json, ($checkedConvert) {
      final val = _SkillCategory(
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        skills: $checkedConvert(
          'skills',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const <Skill>[],
        ),
      );
      return val;
    });

Map<String, dynamic> _$SkillCategoryToJson(_SkillCategory instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'skills': instance.skills.map((e) => e.toJson()).toList(),
    };

_Skill _$SkillFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_Skill', json, ($checkedConvert) {
  final val = _Skill(
    name: $checkedConvert('name', (v) => v as String),
    level: $checkedConvert(
      'level',
      (v) =>
          $enumDecode(_$SkillLevelEnumMap, v, unknownValue: SkillLevel.bottom),
    ),
    personalOnly: $checkedConvert('personalOnly', (v) => v as bool? ?? false),
  );
  return val;
});

Map<String, dynamic> _$SkillToJson(_Skill instance) => <String, dynamic>{
  'name': instance.name,
  'level': _$SkillLevelEnumMap[instance.level]!,
  'personalOnly': instance.personalOnly,
};

const _$SkillLevelEnumMap = {
  SkillLevel.top: 'top',
  SkillLevel.mid: 'mid',
  SkillLevel.bottom: 'bottom',
};
