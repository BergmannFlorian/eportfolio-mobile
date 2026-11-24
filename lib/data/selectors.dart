import 'models/experience.dart';
import 'models/project.dart';
import 'models/skills.dart';

/// Experiences, most recent start first (the API lists jobs, then education).
List<ApiExperience> sortedExperiences(Iterable<ApiExperience> experiences) =>
    [...experiences]..sort((a, b) => b.start.compareTo(a.start));

int _byPosition(ApiProject a, ApiProject b) => a.position.compareTo(b.position);

/// Personal projects (`experienceId == null`), by `position`.
List<ApiProject> personalProjects(Iterable<ApiProject> projects) =>
    projects.where((p) => p.isPersonal).toList()..sort(_byPosition);

/// Client projects (linked to an experience), by `position`.
List<ApiProject> clientProjects(Iterable<ApiProject> projects) =>
    projects.where((p) => !p.isPersonal).toList()..sort(_byPosition);

/// Client projects of one experience.
class ProjectGroup {
  const ProjectGroup({
    required this.experienceId,
    required this.experience,
    required this.projects,
  });

  final String experienceId;

  /// `null` when the experience is missing from `/experiences`.
  final ApiExperience? experience;
  final List<ApiProject> projects;
}

/// Client projects grouped by experience. Groups follow the position of their
/// first project, and projects keep their `position` order inside a group.
List<ProjectGroup> clientProjectGroups(
  Iterable<ApiProject> projects,
  Iterable<ApiExperience> experiences,
) {
  final byId = {for (final e in experiences) e.id: e};
  final groups = <String, List<ApiProject>>{};
  for (final project in clientProjects(projects)) {
    groups.putIfAbsent(project.experienceId!, () => []).add(project);
  }
  return [
    for (final MapEntry(:key, :value) in groups.entries)
      ProjectGroup(experienceId: key, experience: byId[key], projects: value),
  ];
}

/// Featured projects of a list, keeping its order.
List<ApiProject> featured(Iterable<ApiProject> projects) =>
    projects.where((p) => p.featured).toList();

/// Projects referenced by [experience], in the experience's order.
List<ApiProject> linkedProjects(
  ApiExperience experience,
  Iterable<ApiProject> projects,
) {
  final byId = {for (final p in projects) p.id: p};
  return [for (final id in experience.projectIds) ?byId[id]];
}

/// Skills sorted by recency (`top` first), keeping the API order otherwise.
List<Skill> sortedSkills(Iterable<Skill> skills) {
  final indexed = skills.indexed.toList()
    ..sort((a, b) {
      final byLevel = a.$2.level.index.compareTo(b.$2.level.index);
      return byLevel != 0 ? byLevel : a.$1.compareTo(b.$1);
    });
  return [for (final (_, skill) in indexed) skill];
}
