import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectKind { website, script, app }

enum ProjectStatus {
  online,
  @JsonValue('in_progress')
  inProgress,
  archived,
}

/// `GET /projects`.
@freezed
abstract class ApiProject with _$ApiProject {
  const ApiProject._();

  const factory ApiProject({
    required String id,
    required String name,
    String? url,

    /// `null` means a personal project.
    String? experienceId,
    @Default(false) bool featured,

    /// Description paragraphs.
    @Default(<String>[]) List<String> tasks,

    /// Highlights.
    @Default(<String>[]) List<String> details,

    /// Technologies.
    @Default(<String>[]) List<String> skills,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    ProjectKind? kind,
    int? year,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    ProjectStatus? status,
    String? hosting,

    /// Usage example, usually a shell command.
    String? snippet,

    /// Display order (1 = first), numbered separately for personal and
    /// client projects.
    @Default(0) int position,
  }) = _ApiProject;

  factory ApiProject.fromJson(Map<String, Object?> json) =>
      _$ApiProjectFromJson(json);

  bool get isPersonal => experienceId == null;
}
