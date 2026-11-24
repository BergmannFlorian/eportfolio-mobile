import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

enum ExperienceKind { job, education }

/// `GET /experiences`: a job or an education entry.
@freezed
abstract class ApiExperience with _$ApiExperience {
  const ApiExperience._();

  const factory ApiExperience({
    required String id,
    required ExperienceKind kind,
    required String title,
    String? degree,
    String? organization,
    required DateTime start,

    /// `null` means the experience is ongoing.
    DateTime? end,
    @Default(<String>[]) List<String> tasks,
    @Default(<String>[]) List<String> skills,
    @Default(<String>[]) List<String> projectIds,
  }) = _ApiExperience;

  factory ApiExperience.fromJson(Map<String, Object?> json) =>
      _$ApiExperienceFromJson(json);

  bool get isOngoing => end == null;
}
