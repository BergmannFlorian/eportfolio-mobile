import 'models/experience.dart';
import 'models/project.dart';
import 'models/skills.dart';

/// Experiences, most recent start first. The API is meant to send them in
/// that order, but as of 2026-11 it still lists jobs, then education.
List<ApiExperience> sortedExperiences(Iterable<ApiExperience> experiences) =>
    [...experiences]..sort((a, b) => b.start.compareTo(a.start));

// Projects come sorted by `position`: keep the response order, never re-sort.

/// Personal projects (`experienceId == null`), in response order.
List<ApiProject> personalProjects(Iterable<ApiProject> projects) =>
    projects.where((p) => p.isPersonal).toList();

/// Client projects (linked to an experience), in response order.
List<ApiProject> clientProjects(Iterable<ApiProject> projects) =>
    projects.where((p) => !p.isPersonal).toList();

/// Skill categories that have at least one skill, in response order.
List<SkillCategory> nonEmptyCategories(Iterable<SkillCategory> categories) =>
    categories.where((c) => c.skills.isNotEmpty).toList();

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

/// Client projects grouped by experience. Groups follow their first project in
/// the response, and projects keep the response order inside a group.
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
