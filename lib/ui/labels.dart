import '../data/models/experience.dart';
import '../data/models/project.dart';
import '../data/models/skills.dart';
import '../l10n/generated/app_localizations.dart';

String experienceKindLabel(AppLocalizations l10n, ExperienceKind kind) =>
    switch (kind) {
      ExperienceKind.job => l10n.kindJob,
      ExperienceKind.education => l10n.kindEducation,
    };

String projectKindLabel(AppLocalizations l10n, ProjectKind kind) =>
    switch (kind) {
      ProjectKind.website => l10n.projectKindWebsite,
      ProjectKind.script => l10n.projectKindScript,
      ProjectKind.app => l10n.projectKindApp,
    };

String projectStatusLabel(AppLocalizations l10n, ProjectStatus status) =>
    switch (status) {
      ProjectStatus.online => l10n.projectStatusOnline,
      ProjectStatus.inProgress => l10n.projectStatusInProgress,
      ProjectStatus.archived => l10n.projectStatusArchived,
    };

String skillLevelLabel(AppLocalizations l10n, SkillLevel level) =>
    switch (level) {
      SkillLevel.top => l10n.levelTop,
      SkillLevel.mid => l10n.levelMid,
      SkillLevel.bottom => l10n.levelBottom,
    };

/// Display name of a social network key sent by the API (`linkedin`…).
String networkLabel(String network) =>
    switch (network.toLowerCase()) {
      'linkedin' => 'LinkedIn',
      'github' => 'GitHub',
      'gitlab' => 'GitLab',
      'x' || 'twitter' => 'X',
      'mastodon' => 'Mastodon',
      'bluesky' => 'Bluesky',
      _ when network.isEmpty => network,
      _ => network[0].toUpperCase() + network.substring(1),
    };

/// Organization line of an experience: degree and/or organization.
String? experienceSubtitle(ApiExperience e) {
  final parts = [?e.degree, ?e.organization];
  return parts.isEmpty ? null : parts.join(' · ');
}
