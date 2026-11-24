import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills.freezed.dart';
part 'skills.g.dart';

/// How recently a skill was used: `top` is the most recent.
enum SkillLevel { top, mid, bottom }

/// `GET /skills`.
@freezed
abstract class ApiSkills with _$ApiSkills {
  const factory ApiSkills({
    /// Short "main stack" list.
    @Default(<String>[]) List<String> stack,
    @Default(<SkillCategory>[]) List<SkillCategory> categories,
  }) = _ApiSkills;

  factory ApiSkills.fromJson(Map<String, Object?> json) =>
      _$ApiSkillsFromJson(json);
}

@freezed
abstract class SkillCategory with _$SkillCategory {
  const factory SkillCategory({
    /// `langs`, `libs` or `tools`.
    required String code,
    required String name,
    @Default(<Skill>[]) List<Skill> skills,
  }) = _SkillCategory;

  factory SkillCategory.fromJson(Map<String, Object?> json) =>
      _$SkillCategoryFromJson(json);
}

@freezed
abstract class Skill with _$Skill {
  const factory Skill({
    required String name,
    @JsonKey(unknownEnumValue: SkillLevel.bottom) required SkillLevel level,

    /// Only used in personal projects.
    @Default(false) bool personalOnly,
  }) = _Skill;

  factory Skill.fromJson(Map<String, Object?> json) => _$SkillFromJson(json);
}
