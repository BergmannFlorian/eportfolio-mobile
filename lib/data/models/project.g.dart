// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiProject _$ApiProjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ApiProject', json, ($checkedConvert) {
      final val = _ApiProject(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        url: $checkedConvert('url', (v) => v as String?),
        image: $checkedConvert('image', (v) => v as String?),
        imageAlt: $checkedConvert('imageAlt', (v) => v as String?),
        experienceId: $checkedConvert('experienceId', (v) => v as String?),
        featured: $checkedConvert('featured', (v) => v as bool? ?? false),
        tasks: $checkedConvert(
          'tasks',
          (v) =>
              (v as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
        ),
        details: $checkedConvert(
          'details',
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
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(
            _$ProjectKindEnumMap,
            v,
            unknownValue: JsonKey.nullForUndefinedEnumValue,
          ),
        ),
        year: $checkedConvert('year', (v) => (v as num?)?.toInt()),
        status: $checkedConvert(
          'status',
          (v) => $enumDecodeNullable(
            _$ProjectStatusEnumMap,
            v,
            unknownValue: JsonKey.nullForUndefinedEnumValue,
          ),
        ),
        hosting: $checkedConvert('hosting', (v) => v as String?),
        snippet: $checkedConvert('snippet', (v) => v as String?),
        position: $checkedConvert('position', (v) => (v as num?)?.toInt() ?? 0),
      );
      return val;
    });

Map<String, dynamic> _$ApiProjectToJson(_ApiProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'image': instance.image,
      'imageAlt': instance.imageAlt,
      'experienceId': instance.experienceId,
      'featured': instance.featured,
      'tasks': instance.tasks,
      'details': instance.details,
      'skills': instance.skills,
      'kind': _$ProjectKindEnumMap[instance.kind],
      'year': instance.year,
      'status': _$ProjectStatusEnumMap[instance.status],
      'hosting': instance.hosting,
      'snippet': instance.snippet,
      'position': instance.position,
    };

const _$ProjectKindEnumMap = {
  ProjectKind.website: 'website',
  ProjectKind.script: 'script',
  ProjectKind.app: 'app',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.online: 'online',
  ProjectStatus.inProgress: 'in_progress',
  ProjectStatus.archived: 'archived',
};
