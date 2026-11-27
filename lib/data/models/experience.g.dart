// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiExperience _$ApiExperienceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ApiExperience', json, ($checkedConvert) {
      final val = _ApiExperience(
        id: $checkedConvert('id', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$ExperienceKindEnumMap, v),
        ),
        title: $checkedConvert('title', (v) => v as String),
        degree: $checkedConvert('degree', (v) => v as String?),
        organization: $checkedConvert('organization', (v) => v as String?),
        organizationLogo: $checkedConvert(
          'organizationLogo',
          (v) => v as String?,
        ),
        start: $checkedConvert('start', (v) => DateTime.parse(v as String)),
        end: $checkedConvert(
          'end',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        tasks: $checkedConvert(
          'tasks',
          (v) =>
              (v as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
        ),
        skills: $checkedConvert(
          'skills',
          (v) =>
              (v as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
        ),
        projectIds: $checkedConvert(
          'projectIds',
          (v) =>
              (v as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
        ),
      );
      return val;
    });

Map<String, dynamic> _$ApiExperienceToJson(_ApiExperience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$ExperienceKindEnumMap[instance.kind]!,
      'title': instance.title,
      'degree': instance.degree,
      'organization': instance.organization,
      'organizationLogo': instance.organizationLogo,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'tasks': instance.tasks,
      'skills': instance.skills,
      'projectIds': instance.projectIds,
    };

const _$ExperienceKindEnumMap = {
  ExperienceKind.job: 'job',
  ExperienceKind.education: 'education',
};
